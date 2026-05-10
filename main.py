import os
import sys


def create_symlinks_for_scripts():
    # Lấy đường dẫn tuyệt đối của thư mục chứa file main.py
    current_dir = os.path.dirname(os.path.abspath(__file__))

    # Đường dẫn tới thư mục scripts
    scripts_dir = os.path.join(current_dir, "scripts")

    # Đường dẫn tới Desktop của người dùng
    desktop_dir = os.path.join(os.path.expanduser("~"), "Desktop")

    # Kiểm tra xem thư mục scripts có tồn tại không
    if not os.path.exists(scripts_dir):
        print(f"❌ Không tìm thấy thư mục: {scripts_dir}")
        return

    print(f"📁 Bắt đầu xử lý các file trong: {scripts_dir}")
    print("-" * 40)

    # Lặp qua tất cả các mục trong thư mục scripts
    for filename in os.listdir(scripts_dir):
        src_file = os.path.join(scripts_dir, filename)

        # Chỉ xử lý nếu đó là file, bỏ qua nếu là thư mục con
        if not os.path.isfile(src_file):
            continue

        # Đường dẫn file link trên Desktop (dst)
        dst_link = os.path.join(desktop_dir, filename)

        try:
            # # Nếu trên Desktop đã có sẵn file/link trùng tên, ta cần xóa nó đi trước khi tạo mới
            # if os.path.exists(dst_link) or os.path.islink(dst_link):
            #     os.remove(dst_link)

            # Tạo symbolic link
            os.symlink(src_file, dst_link)
            print(f"✅ Đã tạo symbolic link cho: {filename}")
            print(f"   Từ: {dst_link}")
            print(f"   Trỏ tới: {src_file}")

        except OSError as e:
            print(f"❌ Lỗi khi tạo symlink cho {filename}: {e}")
            # Trên hệ điều hành Windows, việc tạo symlink đôi khi yêu cầu quyền Admin
            if sys.platform == "win32":
                print(
                    "💡 Lưu ý: Trên Windows, bạn cần chạy terminal dưới quyền Administrator, hoặc bật chế độ 'Developer Mode' trong cài đặt Windows để tạo symbolic link mà không cần quyền Admin."
                )
                # Dừng vòng lặp nếu gặp lỗi phân quyền để tránh in thông báo lỗi liên tục cho từng file
                break

        print("-" * 20)


def main():
    print("🚀 Hello from dev-run-microservice!")
    print("=" * 40)
    create_symlinks_for_scripts()


if __name__ == "__main__":
    main()
