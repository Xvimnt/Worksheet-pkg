<master src="../master">
<div class="card">
  <div class="card-header card-header-primary card-header-icon">
        <h4 class="card-title"><i class="fas fa-user-friends"></i> Gestor de Empleados</h4>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-12">
            <table class="table" id="myTable" width="100%">
              <thead class="bg-warning font-weight-bold">
                  <tr>
                      <td scope="col" class="text-center">Opciones</td>
                      <td scope="col">Nombre</td>
                      <td scope="col">Apellido</td>
                      <td scope="col">E-mail</td>
                      <td scope="col">Fecha de Inicio</td>
                      <td scope="col">Status</td>
                  </tr>
              </thead>
              <tbody>
                  <multiple name="employee_mr">
                          <tr scope="row">
                              <td width="15%" class="text-center">
                                  <div class="btn-group" role="group" aria-label="Opciones">
                                      @employee_mr.adds_button;noquote@
                                      @employee_mr.edit_button;noquote@
                                      @employee_mr.delete_button;noquote@
                                  </div>
                              </td>
                              <td>@employee_mr.name@</td>
                              <td>@employee_mr.lastname@</td>
                              <td>@employee_mr.email@</td>
                              <td>@employee_mr.start_date@</td>
                              <td>
                                <switch @employee_mr.status@>
                                  <case value="t">
                                    Activo
                                  </case>
                                  <case value="f">
                                    Inactivo
                                  </case>
                                </switch>
                              </td>
                          </tr>  
                  </multiple>
              </tbody>    
          </table>
        </div>
      </div>
      <div class="row"> 
          <div class="col-md-12 text-center">
               <!-- Button trigger modal -->
              <button type="button" class="btn btn-warning" onclick="prompt_request('@ae_url@')">
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

  function prompt_request(url) {
      $('#dialog-body').load(url, function() {
           // alert('Load was performed.');
      });
      $('#dialog').modal({show:true});
  }

 function change_status( item_id, status ) {
        Swal.fire({
            title: '¿Quieres cambiarle el estado a este elemento?',
            showCancelButton: true,
            confirmButtonText: `Yes`,
            icon: 'warning',
            }).then((result) => {
                if (result.isConfirmed) {
                   post_delete(item_id, status);
                }
            })  
    }

    function post_delete(item_id, status) {
        $.ajax({
            type: "GET",
            url: "@status_url@?item_id="+item_id+"&status="+status,
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