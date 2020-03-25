public class GetOpportunitybyMonthbyStage {
    public void createOpportunitybyMonthbyStage(Id accId){
        Map<String,List<Opportunity>> closeMonthtoOpportunityMap=new Map<String,List<Opportunity>>();
        List<String> monthList=new List<String>{'','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
        for(Opportunity opp:[SELECT Id,Name,CloseDate,StageName
                             FROM Opportunity
                             WHERE AccountId=:accId])
                             {
							 Integer monthValue=opp.CloseDate.month(); 
                             String month=monthList.get(monthValue);
                             String key=month+'*'+opp.StageName;
                             if(!closeMonthtoOpportunityMap.containsKey(key))
                                {
                                    closeMonthtoOpportunityMap.put(key,new List<Opportunity>());
                                }
                             closeMonthtoOpportunityMap.get(key).add(opp);
                             }
        for(String key:closeMonthtoOpportunityMap.keySet())//key is month*stagename
        {
			String oppString='';
            for(Opportunity opp:closeMonthtoOpportunityMap.get(key)){
                oppString= oppString+ ' *** ' + opp.Name;
            }
            List<String> keyList=key.split('\\*');
            System.debug('For Month '+keyList.get(0)+ '>>>' + ' For Stage ' + keyList.get(1) + '>>>' + oppString);
        }
        
    }
}