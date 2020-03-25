public class ListDemo {
    public ListDemo(){
        //initialize before use to avoid null pointer exception
        List<String> colorList;
        colorList =new List<String>();
        //add values to list
        colorList.add('red');
        colorList.add('yellow');
        colorList.add('green');
        System.debug(colorList);
        //retrieve values
        System.debug(colorList.get(0));
  		//get size of list
  		System.debug(colorList.size());
        
        //creating another list
        List<String> otherColorList=new List<String>();
        otherColorList.add('black');
        otherColorList.add('white');
        otherColorList.add('green');
        
        //merge both list using addAll
        //addAll is used to merge multiple values
        colorList.addAll(otherColorList);
        System.debug(colorList.size());
        
        //iterate the list
        for(Integer index=0 ; index<colorList.size() ; index++){
            System.debug(colorList.get(index));
        }
        /* another way to iterate
			foreach(String color:colorList){
			System.debug(color);
		}*/
        
        //to clear all list values
        colorList.clear();
        System.debug(colorList.size());
    }
    
}