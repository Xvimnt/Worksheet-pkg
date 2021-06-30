<master src="../../master">
<div class="card">
  <div class="card-header card-header-primary card-header-icon">
        <h4 class="card-title"><i class="fas fa-user-friends"></i> Gestor de Bonificaciones para Empleados</h4>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-12">
            <table class="table" id="myTable" width="100%">
              <thead class="bg-warning font-weight-bold">
                  <tr>
                      <td scope="col" class="text-center">Opciones</td>
                      <td scope="col">Tipo de Bonificaci&oacute;n</td>
                      <td scope="col">Cuota (Q.)</td>
                      <td scope="col">Fecha</td>
                  </tr>
              </thead>
              <tbody>
                  <multiple name="bonification_mr">
                          <tr scope="row">
                              <td width="15%" class="text-center">
                                  <div class="btn-group" role="group" aria-label="Opciones">
                                      @bonification_mr.edit_button;noquote@
                                      @bonification_mr.delete_button;noquote@
                                  </div>
                              </td>
                              <td>
                                <switch @bonification_mr.type@>
                                    <case value="b">
                                            Bonificacion de ley
                                    </case>
                                    <case value="i">
                                            ISR
                                    </case>
                                    <default>
                                            Unknow
                                    </default>
                                </switch>
                              </td>
                              <td>@bonification_mr.amount@</td>
                              <td>@bonification_mr.date@</td>
                          </tr>  
                  </multiple>
              </tbody>    
          </table>
        </div>
      </div>
      <div class="row"> 
          <div class="col-md-12 text-center">
               <!-- Button trigger modal -->
              <button type="button" class="btn btn-warning" onclick="prompt_request('@ae_url@?employee_id=@employee_id@')">
                <i class="fas fa-plus"></i>&nbsp; Añadir Bonificacion
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
        <h5 class="modal-title" id="staticBackdropLabel"><i class="fas fa-plus"></i> Bonificacion </h5>
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

  function prompt_request(url) {
      $('#dialog-body').load(url, function() {
           // alert('Load was performed.');
      });
      $('#dialog').modal({show:true});
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