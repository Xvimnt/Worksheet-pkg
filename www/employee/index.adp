<master src="../master">
<div class="card">
  <div class="card-header card-header-primary card-header-icon">
        <h4 class="card-title"><i class="fas fa-user-friends"></i> Gestor de Empleados</h4>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-12">
            <table class="table" id="myTable" width="100%">
              <thead class="bg-warning">
                  <tr>
                      <td scope="col">Options</td>
                      <td scope="col">Name</td>
                      <td scope="col">Lastname</td>
                      <td scope="col">Start Date</td>
                  </tr>
              </thead>
              <tbody>
                  <multiple name="employee_mr">
                          <tr scope="row">
                              <td width="50px">
                                  <div class="btn-group" role="group" aria-label="Options">
                                      @employee_mr.edit_button;noquote@
                                      @employee_mr.delete_button;noquote@
                                  </div>
                              </td>
                              <td>@employee_mr.name@</td>
                              <td>@employee_mr.lastname@</td>
                              <td>@employee_mr.start_date@</td>
                          </tr>  
                  </multiple>
              </tbody>    
          </table>
        </div>
      </div>
      <div class="row"> 
          <div class="col-md-12 text-center">
               <!-- Button trigger modal -->
              <button type="button" class="btn btn-warning" onclick="new_item()">
                <i class="fas fa-plus"></i>&nbsp; Añadir Empleado
              </button>
          </div>
      </div>
    </div>
</div>
<!-- Modal -->
<div id="dialog" class="modal fade bs-example-modal-lg" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="fas fa-user-friends"></i> Empleado </h5>
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
    $(document).ready(function() {
        $('#myTable').DataTable({
            responsive: true
        });
    });

    function new_item() {
        $('#dialog-body').load('@form_url@', function() {
             // alert('Load was performed.');
        });
        $('#dialog').modal({show:true});
    }

    async function complete_item(item_id) {
        $.ajax({
            type: "GET",
            url: "@form_url@?item_id="+item_id+"&new_status=c",
            success: function (data, textStatus, jqXHR) {
                
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("Error Loading: "+errorThrown)
            },
            always: function (jqXHR, textStatus, errorThrown) {
                alert("always Loading: " + jqXHR)
            },
        });
        setTimeout(function() { 
            window.location.reload();
        }, 500);
    }

    function delete_item( item_id ) {
        Swal.fire({
            title: 'Do you want to delete this item?',
            showCancelButton: true,
            confirmButtonText: `Yes`,
            icon: 'warning',
            }).then((result) => {
                if (result.isConfirmed) {
                   post_delete(item_id);
                }
            })  
    }

    function post_delete(item_id) {
        $.ajax({
            type: "POST",
            url: "@delete_url@",
            data: {item_id: item_id},
            success: function (data, textStatus, jqXHR) {
                window.location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("Error Loading: "+errorThrown)
            }
        });
        setTimeout(function() { 
            window.location.reload();
        }, 500);
    }

</script>