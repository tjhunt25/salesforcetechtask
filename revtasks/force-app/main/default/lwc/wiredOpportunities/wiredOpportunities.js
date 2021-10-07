import { LightningElement, wire, track} from 'lwc';
import retrieveOpportunities from '@salesforce/apex/OpportunityController.retrieveOpportunities'
import retrieveStages from '@salesforce/apex/OpportunityController.retrieveStages';

export default class WiredOpportunities extends LightningElement {
    @track isLoading;
    @track oppStage = null;
    @track oppStages = [];
    @track opportunities = [];
    @track opportunitiesData = [];

    /*
     * @description: columns for the opportunity data table
	 */ 
    opportunityColumns = [
        {label: 'Opportunity Name', fieldName: 'Name', type: 'text'},
        {label: 'Stage', fieldName: 'StageName', type: 'text'},
    ]
    /*
     * @description: calls the methods for setting the opportunity filter with opportunity stages and retrieves the opportunities
	 */ 
    connectedCallback() {
        this.handleRetrieveStages();
        this.handleRetrieveOpportunities();
    }

    /*
     * @description: handle new changes and updates the data table with the filtered rows
	 */ 
    handleChange(event) {
        this.oppStage = event.target.value;
        console.log('oppStage: '+this.oppStage);
        var opps = [];
        if(!this.oppStage) {
            console.log('all opportunities');
            this.opportunitiesData = this.opportunities;
        }
        else {
            console.log('else');
            this.opportunitiesData = [];
            this.opportunities.forEach(n => {
                if(n.StageName === this.oppStage) {
                    opps.push(n);
                }
            })
            this.opportunitiesData = opps;
        }
    }
    /*
     * @description: calls the retrieveStages apex method to build the options for the opportunity filter
	 */ 
    handleRetrieveStages() {
        retrieveStages()
        .then(result => {
            this.oppStages = [];
            var data = JSON.parse(result);
            for(var key in JSON.parse(result)) {
                this.oppStages.push({value: data[key], label: key})
            }
        })
        .catch(error =>{
            this.oppStages = [];
        
        })
    }
    /*
     * @description: calls the retrieveOpportunities apex method to retrieve all opportunities once the page has been loaded.
	 */ 
    handleRetrieveOpportunities() {
        this.isLoading = true;
        console.log('handleRetrieveOpportunities');
        retrieveOpportunities() 
        .then(result => {
            this.opportunitiesData = JSON.parse(result);
            this.opportunities = JSON.parse(result);
            this.isLoading = false;
        })
        .catch(error => {
            this.opportunities = null;
            console.log('error: '+JSON.stringify(error));
            this.isLoading = false;
        })
    }
}