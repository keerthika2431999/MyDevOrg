import { LightningElement,api} from 'lwc';

export default class LwcDemo25ContactInfo extends LightningElement {
    @api contactInfo = {id: "1", name: "sai" , email: "sai@mtxb2b.com"};
    
    tileClickHandler(){ 
        var tileClicked = new CustomEvent('tileclick',{detail : this.contactInfo,bubbles:true}); 
        this.dispatchEvent(tileClicked); 
        }
}