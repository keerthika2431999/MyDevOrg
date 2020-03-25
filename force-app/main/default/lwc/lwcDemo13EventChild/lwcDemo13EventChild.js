import { LightningElement,api } from 'lwc';

export default class LwcDemo13EventChild extends LightningElement {
    @api contactInfo = {id: "1", name: "Keerthika" , email: "keerthika.pandya@mtxb2b.com"};
    tileClickHandler(){
        var tileClicked=new CustomEvent('tileclick',{detail:this.contactInfo,bubbles:true});//bubbles:true is written tp from child to parent,written when ontileclick is not written
        this.dispatchEvent(tileClicked);
    }
}