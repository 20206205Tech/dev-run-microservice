import time
import subprocess
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor

def process_repo(repo_path):
    """
    Hàm xử lý cho từng Git repository.
    Chạy lệnh 'git nghia-git-commit-no-verify' 2 lần trong thư mục repo_path.
    """
    # Lệnh git cần chạy
    cmd = ["git", "nghia-git-commit-no-verify"]
    
    try:
        # Chạy lần 1 (cwd=repo_path thay thế cho việc pushd/popd)
        subprocess.run(cmd, cwd=repo_path, capture_output=True, text=True)
        
        # Chạy lần 2
        subprocess.run(cmd, cwd=repo_path, capture_output=True, text=True)
        
        return f"✅ Đã xử lý xong: {repo_path.name}"
    except Exception as e:
        return f"❌ Lỗi ở {repo_path.name}: {e}"

def main():
    # Tương đương: timeout /t 1 /nobreak
    time.sleep(1)

    # Đặt thư mục gốc
    root_dir = Path(r"C:\Users\Admin\Documents\GitHub")
    
    if not root_dir.exists():
        print(f"Thư mục không tồn tại: {root_dir}")
        return

    # Lấy danh sách các thư mục con chứa folder .git
    git_repos = [
        folder for folder in root_dir.iterdir() 
        if folder.is_dir() and (folder / ".git").exists()
    ]

    print(f"Tìm thấy {len(git_repos)} Git repositories. Bắt đầu xử lý song song...")

    # Chạy song song bằng ThreadPoolExecutor cho nhanh
    # Bạn có thể chỉnh max_workers tùy vào số luồng muốn chạy đồng thời (mặc định sẽ tối ưu theo số nhân CPU)
    with ThreadPoolExecutor() as executor:
        # Giao việc cho các luồng xử lý
        results = executor.map(process_repo, git_repos)
        
        # In kết quả trả về từ mỗi luồng
        for result in results:
            print(result)

    print("Hoàn thành!")

if __name__ == "__main__":
    main()