import { LightningElement ,track} from 'lwc';

export default class LwcDemo13EventParent extends LightningElement {
    contactInfoList = [
        {id: "11", name: "Sahil11" , email: "sahil11@mtxb2b.com"},
        {id: "12", name: "Sahil12" , email: "sahil12@mtxb2b.com"},
        {id: "13", name: "Sahil13" , email: "sahil13@mtxb2b.com"},
        {id: "14", name: "Sahil14" , email: "sahil14@mtxb2b.com"},
        {id: "15", name: "Sahil15" , email: "sahil15@mtxb2b.com"},
        {id: "16", name: "Sahil16" , email: "sahil16@mtxb2b.com"}
    ];
     @track selectedContactInfo;
    onTileSelectHandler(event){
        var contactInfo=event.detail;
        this.selectedContactInfo=contactInfo.name;
    }
    constructor(){
        super();//to continue the flow
        this.template.addEventListener('tileclick',this.onTileSelectHandler.bind(this));//can be written instead of ontileclick
    }
}