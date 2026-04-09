import tkinter as tk
from tkinter import messagebox
import random

# тексти помилок
errors = [
    "Error: 0x0000000A",
    "DIR ERROR: C:\\Windoms",
    "YOU RUN A MALWARE XD",
    "&#!%",
    "(^)&"
]

def on_click():
    msg = random.choice(errors)
    messagebox.showerror("Error", msg)
    root.destroy()

root = tk.Tk()
root.title("disco.py")
root.geometry("200x100")
root.resizable(False, False)

btn = tk.Button(root, text="[O]", command=on_click, width=10, height=2)
btn.pack(expand=True)

root.mainloop()
