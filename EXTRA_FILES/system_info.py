# Create a Python script to check CPU and GPU information

import os
import torch

print("=== SYSTEM INFO CHECK ===\\n")

# CPU Info
print(f"Logical CPU cores available: {os.cpu_count()}")

try:
    with open("/proc/cpuinfo", "r") as f:
        model_name = next((line.split(":")[1].strip() for line in f if "model name" in line), "Unknown")
        print(f"CPU Model: {model_name}")
except Exception:
    print("Could not determine detailed CPU model info.")

# GPU Info
print(f"CUDA Available: {torch.cuda.is_available()}")
print(f"Total GPUs Detected: {torch.cuda.device_count()}")

for i in range(torch.cuda.device_count()):
    print(f"GPU {i}: {torch.cuda.get_device_name(i)}")

print("\\nDone.")


