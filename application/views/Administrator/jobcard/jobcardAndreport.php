<div id="jobcardInvoice">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<jobcard-invoice v-bind:jobcard_id="jobcardId"></jobcard-invoice>
		</div>
	</div>
</div>

<script src="<?php echo base_url();?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/components/jobcardInvoice.js"></script>
<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>
<script>
	new Vue({
		el: '#jobcardInvoice',
		components: {
			jobcardInvoice
		},
		data(){
			return {
				jobcardId: parseInt('<?php echo $jobcardId;?>')
			}
		}
	})
</script>

