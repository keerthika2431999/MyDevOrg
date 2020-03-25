public class GetOpportunityByMonth {
    public Map<String,List<Opportunity>> createMonthtoOpportunityMap(Id recordId){
        Map<String,List<Opportunity>> closeMonthtoOpportunityMap=new Map<String,List<Opportunity>>();
        //to convert month integer to string (jan,feb...)
        List<String> monthList=new List<String>{'','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
        //query for opportunity
       for(Opportunity opp:[SELECT Id,Name,CloseDate
                           FROM Opportunity
                            WHERE AccountId=:recordId]){
                               Integer monthValue=opp.CloseDate.month(); 
                               String month=monthList.get(monthValue);
                                if(!closeMonthtoOpportunityMap.containsKey(month))
                                {
                                    closeMonthtoOpportunityMap.put(month,new List<Opportunity>());//adds {jan=List<opportunity>} in map,List<opportunity> is empty list
                                }
                                   //gives empty list of opportunities, add() adds the opportunities
                                   closeMonthtoOpportunityMap.get(month).add(opp);
                            }
        return closeMonthtoOpportunityMap;
    }//end of createMonthtoOpportunityMap()	
    public void printMap(Id accId){
			Map<String,List<Opportunity>> closeMonthtoOpportunityMap=createMonthtoOpportunityMap(accId);
        for(String month: closeMonthtoOpportunityMap.keySet()){
            String opportunityString='';
            for(Opportunity opp:closeMonthtoOpportunityMap.get(month))
            {
               opportunityString= opportunityString+ ' *** ' + opp.Name;
            }
            System.debug('For Month '+month+' opportunity>>>'+opportunityString);
        }
    }
}