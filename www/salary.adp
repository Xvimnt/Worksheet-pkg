<master src="master">
<div class="row"> 
    <div class="col-md-12 text-center">
         <!-- Button trigger modal -->
        <button type="button" class="btn btn-warning" onclick="new_salary()">
          Add New Date
        </button>
    </div>
</div>
<!-- Modal -->
<div id="dialog" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Add new date</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"  id="dialog-body">
        
      </div>
    </div>
  </div>
</div>
<script>
    // $(document).ready(function() {
    //     $('#myTable').DataTable({
    //         responsive: true
    //     });
    // });

    function new_salary() {
        $('#dialog-body').load('@salary_url@', function() {
             // alert('Load was performed.');
        });
        $('#dialog').modal({show:true});
    }
</script>