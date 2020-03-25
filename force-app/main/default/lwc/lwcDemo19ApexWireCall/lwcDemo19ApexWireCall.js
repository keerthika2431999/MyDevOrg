import { LightningElement, wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountManager.getAccount'
export default class LwcDemo19ApexWireCall extends LightningElement {
    @wire(getAllAccounts)
    accounts;
    get responsereceived(){
        if(this.accounts.data){
            return true;
        }
        return false;
    }
}