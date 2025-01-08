func synchronousTask() {
    print("Start synchronous task")
    Thread.sleep(forTimeInterval: 2) // 2초 대기
    print("End synchronous task")
}

synchronousTask()
print("This runs after the synchronous task is complete.")

