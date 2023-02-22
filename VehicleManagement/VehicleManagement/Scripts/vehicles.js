var row_template = `<tr>
                        <td>{plate}</td>
                        <td>{nickname}</td>
                        <td>{brand}</td>
                        <td>{modelyear}</td>
                        <td>{type}</td>
                        <td>{color}</td>
                        <td>{isactive}</td>
                    </tr>`;

$(document).ready(function () {

    getVehicles();
    bindEvents()     
   
});

function bindEvents() {

    $("#txt_search").bind("keyup", function () {
      
            var searchText = $(this).val().toLowerCase();
            getVehicles(searchText);     

    });

}

function getVehicles(searchText) {

    table = $("#vehicles_table");

    table.empty();

    $.ajax({
        url: '/Home/GetVehicles',
        data: {
            "nickname": searchText,
        },
        type: 'GET',
        success: function (vehicles) {
            debugger;
            if (vehicles && vehicles.length > 0) {

                table = $("#vehicles_table");
                let template;;

                $.each(vehicles, function (index, vehicle) {

                    template = row_template;

                    template = template.replace("{plate}", vehicle.Plate);
                    template = template.replace("{nickname}", vehicle.Nickname);
                    template = template.replace("{brand}", vehicle.Brand);
                    template = template.replace("{modelyear}", vehicle.ModelYear);
                    template = template.replace("{type}", vehicle.Type);
                    template = template.replace("{color}", vehicle.Color);
                    template = template.replace("{isactive}", vehicle.IsActive);

                    table.append(template)
                });

            }
        },
        error: function (error) {
            alert(error.statusText);
        }
    });

}