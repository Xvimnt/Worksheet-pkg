<formtemplate id="bonification_form">
    <div class="row">
        <div class="col-md-6">
            <label for="type">Tipo: </label> <span class="text-danger"> * (required)</span>
            <formwidget id="type" class="form-control" required>
        </div>
        <div class="col-md-6">
            <label for="amount">Cuota (Q.): </label> <span class="text-danger"> * (required)</span>
            <formwidget id="amount" class="form-control" required>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="start_date">Fecha: </label> <span class="text-danger"> * (required)</span>
            <formwidget id="start_date" class="form-control" required>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-12 text-center">
            <button class="btn btn-warning" type="submit"><i class="fas fa-save"></i>&nbsp; Save</button>
        </div>
    </div>
</formtemplate>

<script type="text/javascript">
    $(document).ready(function() {
       $( "#start_date" ).datepicker({
           format: "dd/mm/yyyy",
           zIndex: 9999,
       });
    });
</script>