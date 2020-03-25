public class AccountTriggerHandler {
    //1.slaexpiration date update
    //2
    public static void updateSLAExpirationDate(List<Account> newList,Map<Id,Account> oldMap,Map<Id,Account> newMap){
        List<Account> accUpdateList=new List<Account>();
        for(Account acc:newList){
            Account obj=new Account();
            obj.Id=acc.Id;
            if(oldMap==null){
                obj.SLAExpirationDate__c=date.today()+180;
            }
            else{
                obj.SLAExpirationDate__c=newMap.get(acc.Id).SLAExpirationDate__c+90;
            }
            accUpdateList.add(obj);
        }
        StaticConstants.runAccountTrigger=FALSE;
        update accUpdateList;
    }
    //2.billing to shipping
    public static void copyBillingtoShipping(List<Account> newList){
        for(Account acc:newlist){
            if(acc.Copy_Billing_To_Shipping__c){
                acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingState=acc.BillingState;
                acc.ShippingStreet=acc.BillingStreet;
                acc.ShippingCity=acc.BillingCity;
                acc.ShippingPostalCode=acc.BillingPostalCode;
            } 
        }
    }
    public static void copyBillingToShippingOnUpdate(List<Account> newList,Map<Id,Account> oldMap){
        for(Account acc:newList){
             Boolean isCheckBoxChanged=True;
            Boolean isBillingChanged=True;
            Boolean isShippingChanged=True;
            if(oldMap!=null){
            isCheckBoxChanged=acc.Copy_Billing_To_Shipping__c!=oldMap.get(acc.Id).Copy_Billing_To_Shipping__c;
            isBillingChanged=(acc.BillingCountry!=oldMap.get(acc.Id).BillingCountry
                                      ||acc.BillingCity!=oldMap.get(acc.Id).BillingCity
                                      ||acc.BillingPostalCode!=oldMap.get(acc.Id).BillingPostalCode
                                      ||acc.BillingStreet!=oldMap.get(acc.Id).BillingStreet
                                      ||acc.BillingState!=oldMap.get(acc.Id).BillingState);
            
             isShippingChanged=(acc.ShippingCountry!=oldMap.get(acc.Id).ShippingCountry
                                       ||acc.ShippingCity!=oldMap.get(acc.Id).ShippingCity
                                       ||acc.ShippingPostalCode!=oldMap.get(acc.Id).ShippingPostalCode
                                       ||acc.ShippingStreet!=oldMap.get(acc.Id).ShippingStreet
                                       ||acc.ShippingState!=oldMap.get(acc.Id).ShippingState);
            }
            if(oldMap==null || isCheckBoxChanged || isBillingChanged || isShippingChanged)
            {
                if(acc.Copy_Billing_To_Shipping__c){
                    if(isShippingChanged && !isCheckBoxChanged && !isBillingChanged)
                    {
                        acc.addError('you cannot update shipping address');
                    }
                    else{
                        acc.ShippingCountry=acc.BillingCountry;
                        acc.ShippingState=acc.BillingState;
                        acc.ShippingStreet=acc.BillingStreet;
                        acc.ShippingCity=acc.BillingCity;
                        acc.ShippingPostalCode=acc.BillingPostalCode;
                    }
                }
                else if(isCheckBoxChanged && oldMap!=NULL && !isShippingChanged){
                    acc.ShippingCountry='';
                    acc.ShippingState='';
                    acc.ShippingStreet='';
                    acc.ShippingCity='';
                    acc.ShippingPostalCode='';
                }
            }
        }
    }
}