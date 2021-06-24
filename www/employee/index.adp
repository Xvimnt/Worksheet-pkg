<master src="../master">
<div class="card">
  <div class="card-header card-header-primary card-header-icon">
        <h4 class="card-title"><i class="fas fa-user-friends"></i> Gestor de Empleados</h4>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-12">
            <table class="table table-light table-striped" id="myTable" style="width: 100%;"></table>
        </div>
      </div>
      <div class="row"> 
          <div class="col-md-12 text-center">
               <!-- Button trigger modal -->
              <button type="button" class="btn btn-warning" onclick="new_salary()">
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
