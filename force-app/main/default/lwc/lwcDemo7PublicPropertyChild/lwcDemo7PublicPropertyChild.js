import { LightningElement,api } from 'lwc';

export default class LwcDemo7PublicPropertyChild extends LightningElement {
    @api contactInfo = {id: "1", name: "Sahil" , email: "sahil@mtxb2b.com"};
}
