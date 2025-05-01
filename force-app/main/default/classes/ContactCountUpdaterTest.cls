@isTest
private class ContactCountUpdaterTest {


@IsTest
    static void testUpdateContactCount() {
        // Create a test Account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create a test Contact associated with the Account
        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact', AccountId = testAccount.Id);
        insert testContact;

        // Call the updateContactCount method
        ContactCountUpdater.updateContactCount(testAccount.Id);

        // Retrieve the updated Account
        testAccount = [SELECT ContactCount__c FROM Account WHERE Id = :testAccount.Id];

        // Verify that the ContactCount__c field is updated to 1
        System.assertEquals(1, testAccount.ContactCount__c, 'ContactCount__c should be updated to 1');
    }

}