import os
import sys


def create_symlink_for_dev_bat():
    # Lấy đường dẫn tuyệt đối của thư mục chứa file main.py
    current_dir = os.path.dirname(os.path.abspath(__file__))

    # Đường dẫn tới file dev.bat gốc trong project (src)
    src_file = os.path.join(current_dir, "dev.bat")

    # Đường dẫn tới Desktop của người dùng
    # os.path.expanduser("~") sẽ tự động dịch "~" thành thư mục Home của user (vd: C:\Users\Admin)
    desktop_dir = os.path.join(os.path.expanduser("~"), "Desktop")

    # Đường dẫn file link trên Desktop (dst)
    dst_link = os.path.join(desktop_dir, "dev.bat")

    # Kiểm tra xem file gốc có tồn tại không
    if not os.path.exists(src_file):
        print(f"❌ Không tìm thấy file gốc: {src_file}")
        return

    try:
        # Nếu trên Desktop đã có sẵn file/link trùng tên, ta cần xóa nó đi trước khi tạo mới
        if os.path.exists(dst_link) or os.path.islink(dst_link):
            os.remove(dst_link)

        # Tạo symbolic link
        os.symlink(src_file, dst_link)
        print(f"✅ Đã tạo symbolic link thành công!")
        print(f"   Từ: {dst_link}")
        print(f"   Trỏ tới: {src_file}")

    except OSError as e:
        print(f"❌ Lỗi khi tạo symlink: {e}")
        # Trên hệ điều hành Windows, việc tạo symlink đôi khi yêu cầu quyền Admin
        if sys.platform == "win32":
            print(
                "💡 Lưu ý: Trên Windows, bạn cần chạy terminal dưới quyền Administrator, hoặc bật chế độ 'Developer Mode' trong cài đặt Windows để tạo symbolic link mà không cần quyền Admin."
            )


def main():
    print("Hello from dev-run-microservice!")
    print("-" * 40)
    create_symlink_for_dev_bat()


if __name__ == "__main__":
    main()
