<formtemplate id="employee_form">
    <div class="row">
        <div class="col-md-6">
            <label for="name">Name: </label> <span class="text-danger"> * (required)</span>
            <formwidget id="name" class="form-control" required>
            <formerror id="name" type="no_special_characters">
                The title may not not contain special characters such as 
                @, $, !, %, & or #.
            </formerror>
        </div>
        <div class="col-md-6">
            <label for="lastname">Lastname: </label> <span class="text-danger"> * (required)</span>
            <formwidget id="lastname" class="form-control" required>
            <formerror id="lastname" type="no_special_characters">
                The title may not not contain special characters such as 
                @, $, !, %, & or #.
            </formerror>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="email">E-mail: </label> <span class="text-danger"> * (required)</span>
            <formwidget id="email" class="form-control" required>
            <formerror id="email" type="no_special_characters">
                The description may not not contain special characters such as 
                @, $, !, %, & or #.
            </formerror>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-12 text-center">
            <button class="btn btn-warning" type="submit"><i class="fas fa-save"></i>&nbsp; Save</button>
        </div>
    </div>
</formtemplate>