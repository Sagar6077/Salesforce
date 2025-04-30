@isTest
public class LeadEmailValidationTest {
  //Testing 
    @isTest
    static void testBlankEmail() {
        Lead lead = new Lead(
            LastName = 'Doe',
            Company = 'TestCorp',
            Email = '' // Blank email - should trigger validation rule
        );

        Test.startTest();
        try {
            insert lead;
            System.assert(false, 'Expected validation error due to blank email');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Email'), 'Expected error to mention Email');
        }
        Test.stopTest();
    }

    @isTest
    static void testInvalidEmailFormat() {
        Lead lead = new Lead(
            LastName = 'Smith',
            Company = 'TestCorp',
            Email = 'invalid-email' // Invalid format - should trigger validation rule
        );

        Test.startTest();
        try {
            insert lead;
            System.assert(false, 'Expected validation error due to invalid email format');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Email'), 'Expected error to mention Email');
        }
        Test.stopTest();
    }

    @isTest
    static void testValidEmail() {
        Lead lead = new Lead(
            LastName = 'Johnson',
            Company = 'TestCorp',
            Email = 'valid@example.com' // Valid format - should pass
        );

        Test.startTest();
        insert lead;
        Test.stopTest();

        System.assertNotEquals(null, lead.Id, 'Lead should be inserted successfully');
    }
}