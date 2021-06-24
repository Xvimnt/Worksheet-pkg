<master src="../master">
<div class="card">
  <div class="card-header card-header-primary card-header-icon">
        <h4 class="card-title"><i class="fas fa-medkit"></i> Gestor de Cuotas de Iggs</h4>
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
                <i class="fas fa-plus"></i>&nbsp; Añadir Fecha
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
        <h5 class="modal-title" id="staticBackdropLabel"><i class="fas fa-calendar"></i> Fecha </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"  id="dialog-body">
        <div class="row">
          <div class="col-md-12">
            <label for="name">Año:</label> <span class="text-danger">* (requerido)</span>
            <input type="text" name="name" id="name" class="form-control" required>    
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <label for="plural">Cuota (Q.):</label> <span class="text-danger">* (requerido)</span>
            <input type="text" name="plural" id="plural" class="form-control" required>    
          </div>
        </div>
        <hr>
        <div class="row">
          <div class="col-md-12 text-center">
            <button class="btn btn-warning"><i class="fas fa-save"> Guardar</i></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  $(document).ready(function() {
    $('#myTable').DataTable({
       ajax: {
            url: "@data_url@",
            dataSrc: "children"
        },
        "columns": [
            { "data": "category_id" },
            { "data": "category_id",
              render: function ( data, type, row ) {
                if(type === 'display') {
                  data = "<div class='btn-group'>";
                  data += '<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#dialog" onclick="edit_salary('+row.category_id+')"  title="Editar"><i class="fas fa-check"></i></button>';
                  data += '<button type="button" class="btn btn-danger" onclick="delete_salary('+row.category_id+')" title="Eliminar"><i class="fas fa-trash"></i></button>';
                  data += "</div>";
                }
                return data
              }
            },
            { "data": "name" },
            { "data": "plural" }
            
        ],
        columnDefs: [ 
          { title: 'id', class:"d-none", targets: 0},
          { title: 'Opciones', width: "20%", class:"text-center", targets: 1},
          { title: 'Año', class:"text-center", targets: 2},
          { title: 'Cuota (Q.)', class:"text-center", targets: 3},
        ]
    });
  });

  function edit_salary(id) {
      $('#dialog-body').load('@salary_url@&category_id=' + id, function() {
           // alert('Load was performed.');
      });
      $('#dialog').modal({show:true});
  }

  function delete_salary(id) {
      $('#dialog-body').load('@salary_delete_url@?category_id=' + id, function() {
           // alert('Load was performed.');
      });
      $('#dialog').modal({show:true});
  }

  function new_salary() {
      $('#dialog').modal({show:true});
  }
</script>