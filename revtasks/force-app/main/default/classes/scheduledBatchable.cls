global class scheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
      preferredContactRecordUpdate b = new preferredContactRecordUpdate(); 
      Database.executeBatch(b);
   }
}