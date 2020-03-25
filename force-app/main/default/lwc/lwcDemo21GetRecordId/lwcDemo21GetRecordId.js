import { LightningElement ,api} from 'lwc';

export default class LwcDemo21GetRecordId extends LightningElement {
    @api recordId;
    @api objectApiName;
    successHanlder(event){
        this.recordId=event.detail.Id;
    }
}