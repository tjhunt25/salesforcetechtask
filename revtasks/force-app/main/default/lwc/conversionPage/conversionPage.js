import { LightningElement, track} from 'lwc';
import getConversionRates from '@salesforce/apex/ConversionPageController.getConversionRates'

export default class ConversionPage extends LightningElement {
    @track currencies;
    @track rates = [];

    /*
     * @description: column attributes for the lightning datatable
	 */ 
    ratesColumns = [
        {label: 'Currency', fieldName: 'currency', type: 'text'},
        {label: 'Rate', fieldName: 'value', type: 'text'}
    ]

    /*
     * @description: handle the new changes and update currencies 
	 */ 
    handleChange(event) {
        this.currencies = event.target.value;
    }
    /*
     * @description: handle the search where the apex method is called to send http request to fixer.io with currencies value as the filter
	 */ 
    handleSearch(event) {
        console.log('handle search: '+this.currencies);
        getConversionRates({
            currencies: this.currencies
        })
        .then(result => {
            var data= JSON.parse(result);
            var rateData = [];
            console.log(JSON.stringify(data));
            for(var key in data) {
                let rate = {};
                rate.Id = key;
                rate.currency = key;
                rate.value = data[key];
                rateData.push(rate);

            }
            this.rates = rateData;
            console.log(JSON.stringify(this.rates));
        })
    }

}