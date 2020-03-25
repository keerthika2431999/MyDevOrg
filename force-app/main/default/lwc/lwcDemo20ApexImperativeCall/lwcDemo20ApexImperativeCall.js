import { LightningElement ,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import getAllAccounts from '@salesforce/apex/AccountManager.getAccountImperative'
export default class LwcDemo20ApexImperativeCall extends LightningElement {
    @track numberOfRecords;
    @track accounts;

    numberChangeHandler(event){
        this.numberOfRecords = event.target.value;
    }

    getAccounts(){
        getAllAccounts({totalRecords : this.numberOfRecords}).then(response=>{
            this.accounts = response;
            const event = new ShowToastEvent({
                title: 'Account Loaded',
                variant : 'success',
                message: this.numberOfRecords + 'Account records are successfully Loaded',
            });
            this.dispatchEvent(event);

        })
        .catch(error=>{
            console.log('>>>'+error.body.message);
        });
    }

    get responsereceived(){
        if(this.accounts){
            return true;
        }
        return false;
    }

}