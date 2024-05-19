import sys
import threading
import time

class MyThread(threading.Thread):
    def __init__(self, thread_id, name, delay):
        threading.Thread.__init__(self)
        self.thread_id = thread_id
        self.name = name
        self.delay = delay
        self._stop_event = threading.Event()

    def stop(self):
        self._stop_event.set()

    def run(self):
        print(f"Starting {self.name}")
        print_time(self.name, self.delay, self._stop_event)
        print(f"Exiting {self.name}")

def print_time(thread_name, delay, stop_event):
    while not stop_event.is_set():
        time.sleep(delay)
        print(f"{thread_name}: {time.ctime(time.time())}")

def main():
    # Create new threads
    thread1 = MyThread(1, "Thread-1", 1)

    # Start thread1
    thread1.start()

    try:
        # Main thread will exit when thread1 exits
        while thread1.is_alive():
            time.sleep(1)
    except KeyboardInterrupt:
        thread1.stop()
        thread1.join()

    print("Exiting Main Thread")

if __name__ == "__main__":
    main()
