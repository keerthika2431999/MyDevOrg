import { LightningElement,wire,api } from 'lwc';
import {fireEvent} from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';


export default class LwcDemo14EventChild extends LightningElement {
    @api contactInfo = {id: "1", name: "Sahil" , email: "sahil@mtxb2b.com"};
    @wire(CurrentPageReference) pageRef;

    tileClickHandler(){
        fireEvent(this.pageRef,'tileclick',this.contactInfo);
        
    }

}