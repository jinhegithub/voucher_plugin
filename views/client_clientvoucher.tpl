
{extends file="$layouts_client"}

{block name="style"}
    <link rel="stylesheet" type="text/css" href="{$app_url}apps/voucher/views/css/global.css" />
{/block}

{block name="content"}
    <div class="row">

        <div class="col-md-12">
            <div class="panel panel-default">

                <div class="panel-body">

                    <div class="table-responsive" id="ib_data_panel">

                        <table class="table table-bordered table-hover display" id="ib_dt">  <!--width="100%" -->
                            <thead>
                            <tr class="heading">
                                <th>#</th>
                                <th>Image</th>
                                <th style="width: 80px;">Date</th>
                                <th>Serial No.</th>
                                <th>Contact</th>
                                <th style="width: 80px;">Expiry</th>
                                <th>Redeem</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th class="text-right" style="width: 80px;">Manage</th>
                            </tr>

                            <tr class="heading">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><input type="text" id="filter_serialnumber" name="filter_serialnumber" class="form-control"></td>
                                <td><input type="text" id="filter_contact" name="filter_contact" class="form-control"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-right" style="width: 80px;"><button type="submit" id="ib_filter" class="btn btn-primary">{$_L['Filter']}</button></td>
                            </tr>
                            </thead>

                        </table>
                    </div>

                </div>
            </div>
        </div>
        {*<input type="hidden" id="vid" name="vid" value="{$vid}">*}
    </div>


{/block}

{block name="script"}
    <script>
        Dropzone.autoDiscover = false;
        $(function() {

            var _url = $("#_url").val();
            var $ib_data_panel = $("#ib_data_panel");
            $ib_data_panel.block({ message:block_msg });

            $('[data-toggle="tooltip"]').tooltip();

            var ib_dt = $('#ib_dt').DataTable( {

                "serverSide": true,
                "ajax": {
                    "url": _url + "voucher/client/json_voucher_list/",
                    "type": "POST",
                    "data": function ( d ) {

                        d.serial_number = $('#filter_serialnumber').val();
                        d.contact = $('#filter_contact').val();

                    }
                },
                "pageLength": 10,
                responsive: true,
                dom: "<'row'<'col-sm-6'i><'col-sm-6'B>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-sm-5'><'col-sm-7'p>>",
                lengthMenu: [
                    [ 10, 25, 50, -1 ],
                    [ '10 rows', '25 rows', '50 rows', 'Show all' ]
                ],
                buttons: [
                    {
                        extend:    'pageLength',
                        text:      '<i class="fa fa-bars"></i>',
                        titleAttr: 'Entries'
                    },
                    {
                        extend:    'colvis',
                        text:      '<i class="fa fa-columns"></i>',
                        titleAttr: 'Columns'
                    },
                    {
                        extend:    'copyHtml5',
                        text:      '<i class="fa fa-files-o"></i>',
                        titleAttr: 'Copy'
                    },
                    {
                        extend:    'excelHtml5',
                        text:      '<i class="fa fa-file-excel-o"></i>',
                        titleAttr: 'Excel'
                    },
                    {
                        extend:    'csvHtml5',
                        text:      '<i class="fa fa-file-text-o"></i>',
                        titleAttr: 'CSV'
                    },
                    {
                        extend:    'pdfHtml5',
                        text:      '<i class="fa fa-file-pdf-o"></i>',
                        titleAttr: 'PDF'
                    },
                    {
                        extend:    'print',
                        text:      '<i class="fa fa-print"></i>',
                        titleAttr: 'Print'
                    }

                ],
                "orderCellsTop": true,
                "columnDefs": [
                    // {
                    //     "render": function ( data, type, row ) {
                    //         return '<a href="' + _url +'voucher/app/list_voucher_page/'+ row[12] +'/'+row[0]+'">'+ data +'</a>';
                    //     },
                    //     "targets": 1
                    // },
                    // {
                    //     "render": function (data, type, row) {
                    //         return '<a href="' + _url +'voucher/app/list_voucher_page/'+ row[12] +'/'+row[0]+'">'+ data +'</a>';
                    //     },
                    //     "targets": 4
                    // },
                    { "orderable": false, "targets": 1 },
                    { "orderable": false, "targets": 7 },
                    { "orderable": false, "targets": 9 },
                    { className: "text-center", "targets": [ 1 ] },
                    { "type": "html-num", "targets": 1 }
                ],
                "order": [[ 0, 'desc' ]],
                "scrollX": true,
                "initComplete": function () {
                    $ib_data_panel.unblock();
                    //
                    // listen_change();
                },
                select: {
                    info: false
                }
            } );

            var $ib_filter = $("#ib_filter");

            $ib_filter.on('click', function(e) {
                e.preventDefault();

                $ib_data_panel.block({ message:block_msg });

                ib_dt.ajax.reload(
                    function () {
                        $ib_data_panel.unblock();
                        // listen_change();
                    }
                );


            });

        });
    </script>
{/block}
