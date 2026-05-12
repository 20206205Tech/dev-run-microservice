import os
import subprocess
import time
import urllib.request
import webbrowser

BASH_EXE = r"C:\Program Files\Git\bin\bash.exe"


# 1. Hàm hỗ trợ: Chờ cho đến khi URL trả về phản hồi thành công
def wait_for_url(url, retry_delay=2):
    print(f"  -> Đang đợi {url} sẵn sàng...")
    while True:
        try:
            with urllib.request.urlopen(url, timeout=5) as response:
                if response.status == 200:
                    print(f"  -> [OK] Dịch vụ đã sẵn sàng!\n")
                    break
        except Exception:
            pass
        time.sleep(retry_delay)


# 2. Danh sách các dịch vụ
list_of_services = [
    # {
    #     "title": "payment-service",
    #     "dir": r"C:\Users\Admin\Documents\GitHub\code-payment-service",
    #     "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash",
    #     "delay": 0,
    #     "url": "http://localhost:33001/code-payment-service/docs"
    # },
    {
        "title": "conversation-service",
        "dir": r"C:\Users\Admin\Documents\GitHub\code-conversation-service",
        "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash",
        "delay": 0,
        "url": "http://localhost:33002/code-conversation-service/docs",
    },
    {
        "title": "chatbot-service",
        "dir": r"C:\Users\Admin\Documents\GitHub\code-chatbot-service",
        "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash",
        "delay": 10,
        "url": "http://localhost:52001/code-chatbot-service/docs",
    },
    {
        "title": "voice",
        "dir": r"C:\Users\Admin\Documents\GitHub\code-chatbot-service",
        "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- uv run python voice.py dev; exec bash",
        "delay": 0,
        "url": None,
    },
    {
        "title": "persona-service",
        "dir": r"C:\Users\Admin\Documents\GitHub\code-persona-service",
        "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash",
        "delay": 0,
        "url": "http://localhost:52003/code-persona-service/docs",
    },
    # {
    #     "title": "document-worker",
    #     "dir": r"C:\Users\Admin\Documents\GitHub\code-document-worker",
    #     "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- uv run celery -A worker.celery_app worker --pool=solo --loglevel=info; exec bash",
    #     "delay": 10,
    #     "url": None
    # },
    # {
    #     "title": "document-service",
    #     "dir": r"C:\Users\Admin\Documents\GitHub\code-document-service",
    #     "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash",
    #     "delay": 0,
    #     "url": "http://localhost:52002/code-document-service/docs"
    # },
    # {
    #     "title": "phapdien",
    #     "dir": r"C:\Users\Admin\Documents\GitHub\data-pipeline-phapdien-service",
    #     "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash",
    #     "delay": 0,
    #     "url": None # Không có
    # },
    # {
    #     "title": "vbplnew",
    #     "dir": r"C:\Users\Admin\Documents\GitHub\data-pipeline-vbplnew-service",
    #     "cmd": "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash",
    #     "delay": 0,
    #     "url": None # Không có
    # }
]

# =========================================================
# VÒNG LẶP 1: BẬT TẤT CẢ CÁC TERMINAL (KHỞI ĐỘNG)
# =========================================================
print("=== BƯỚC 1: KHỞI ĐỘNG CÁC MICROSERVICES ===\n")
for service in list_of_services:
    title = service["title"]
    working_dir = service["dir"]
    bash_cmd = service["cmd"]
    delay = service.get("delay", 0)

    print(f"Đang bật terminal: {title}...")

    if not os.path.exists(working_dir):
        print(f"[Lỗi] Không tìm thấy đường dẫn: {working_dir}")
        print(f"-> Bỏ qua {title} và tiếp tục.\n")
        continue
    # ... (code trước đó giữ nguyên)

    try:
        # 1. Thêm một dấu cách vào cuối title để ép Python luôn bọc ngoặc kép ("")
        safe_title = f"{title} "

        # 2. Truyền safe_title vào thay cho title
        subprocess.Popen(
            [
                "cmd",
                "/c",
                "start",
                safe_title,
                BASH_EXE,
                "--login",
                "-i",
                "-c",
                bash_cmd,
            ],
            cwd=working_dir,
        )

        # Chỉ giữ lại delay (ví dụ delay 10s cho chatbot)...
        if delay > 0:
            print(
                f"  -> Đã cấp lệnh. Tạm dừng {delay} giây trước khi bật terminal tiếp theo...\n"
            )
            time.sleep(delay)

        # ... (code sau đó giữ nguyên)
        else:
            print(f"  -> Đã cấp lệnh. Tiếp tục ngay lập tức...\n")

    except Exception as e:
        print(f"[Lỗi] Không thể khởi động {title}. Chi tiết: {e}\n")


# =========================================================
# VÒNG LẶP 2: ĐỢI CÁC DỊCH VỤ SẴN SÀNG (HEALTH CHECK)
# =========================================================
print("=== BƯỚC 2: KIỂM TRA TRẠNG THÁI SẴN SÀNG (HEALTH CHECK) ===\n")
for service in list_of_services:
    title = service["title"]
    health_url = service.get("url")

    if health_url:
        print(f"Kiểm tra [{title}]...")
        wait_for_url(health_url)
    else:
        print(f"Bỏ qua kiểm tra URL cho [{title}] (không cấu hình).\n")

print("=== HOÀN TẤT BACKEND. CHUẨN BỊ BẬT FRONTEND ===\n")


# =========================================================
# BƯỚC 3: KHỞI ĐỘNG FRONTEND UI VÀ MỞ TRÌNH DUYỆT
# =========================================================
fe_dir = r"C:\Users\Admin\Documents\GitHub\code-fe-ui"
fe_cmd = "npm run start:dev; exec bash"

if os.path.exists(fe_dir):
    print("Đang khởi động Frontend UI...")
    try:
        subprocess.Popen(
            [
                "cmd",
                "/c",
                "start",
                "Frontend UI",
                BASH_EXE,
                "--login",
                "-i",
                "-c",
                fe_cmd,
            ],
            cwd=fe_dir,
        )

        print("Đang đợi 30 giây cho Frontend biên dịch...")
        time.sleep(30)

        print("Đang mở trình duyệt tại http://localhost:3000 ...")
        webbrowser.open("http://localhost:3000")

    except Exception as e:
        print(f"[Lỗi] Không thể khởi động Frontend. Chi tiết: {e}\n")
else:
    print(f"[Lỗi] Không tìm thấy thư mục Frontend UI: {fe_dir}")

print("\n=== ĐÃ HOÀN TẤT TOÀN BỘ QUÁ TRÌNH KHỞI ĐỘNG ===")
