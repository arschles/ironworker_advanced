public class SleepWorker {
  public static void main(String[] args) throws Exception {
    System.out.println("SleepWorker about to sleep for 5 seconds");
    Thread.sleep(5000);
    System.out.println("SleepWorker slept for 5 seconds");
    System.out.println("SleepWorker done");
  }
}
