public class Contacts {
    public static Boolean hasRun = false;

    public static void onBeforeInsert(List<Contact> newContacts) {
        for(Contact con : newContacts){
            if(con.DummyJSON_Id__c == null){
                con.DummyJSON_Id__c = String.valueOf(Math.round(Math.random() * 100));
            }
            else if(Integer.valueOf(con.DummyJSON_Id__c) <= 100){
                DummyJSONCallout.getDummyJSONUserFromId(con.DummyJSON_Id__c);
            }
        }
    }

    public static void onBeforeUpdate(List<Contact> newContacts) {
        for(Contact con : newContacts){
            if(Integer.valueOf(con.DummyJSON_Id__c) > 100){
                DummyJSONCallout.postCreateDummyJSONUser(con.Id);
            }
        }
    }
}
