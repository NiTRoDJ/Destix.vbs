import tkinter as tk

root = tk.Tk()
root.title("disco2.py")
root.geometry("200x100")
root.resizable(False, False)

# швидкість тікання (пікселі за крок)
speed = 5

def move_away(event):
    # координати курсора
    x, y = event.x_root, event.y_root
    # координати вікна
    win_x = root.winfo_x()
    win_y = root.winfo_y()
    win_w = root.winfo_width()
    win_h = root.winfo_height()

    # центр вікна
    center_x = win_x + win_w // 2
    center_y = win_y + win_h // 2

    # напрямок руху
    dx = dy = 0
    if abs(center_x - x) < 100:  # тільки якщо курсор близько
        dx = speed if center_x < x else -speed
    if abs(center_y - y) < 100:
        dy = speed if center_y < y else -speed

    # нові координати
    new_x = max(0, min(root.winfo_screenwidth() - win_w, win_x - dx))
    new_y = max(0, min(root.winfo_screenheight() - win_h, win_y - dy))

    root.geometry(f"+{new_x}+{new_y}")

# ловимо рух курсора всередині вікна
root.bind('<Motion>', move_away)

# кнопка для закриття (якщо треба)
btn = tk.Button(root, text="Close", command=root.destroy, width=10)
btn.pack(expand=True)

root.mainloop()
