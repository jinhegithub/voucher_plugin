
{extends file="$layouts_client"}

{block name="style"}
    <link rel="stylesheet" type="text/css" href="{$app_url}apps/voucher/views/css/global.css" />
{/block}
{block name="content"}

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">

                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div style="text-align: center">
                                <img src="{$baseUrl}/storage/system/{$page_setting['front_img']}" width="100%" />
                            </div>
                            <div style="text-align: center">
                                <img src="{$baseUrl}/storage/system/{$page_setting['back_img']}" width="100%" />
                            </div>

                        </div>
                        <div class="col-md-6 ib_right_panel">
                            <div class="ibox-content">
                                <h2>
                                    {$page_setting['title']}
                                </h2>
                            </div>


                            <form class="form-horizontal" id="frm_redeem">

                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="voucher_number">Voucher No.</label>
                                    <div class="col-md-10">
                                        <input type="text" name="voucher_number" class="form-control" id="voucher_number" value="{$voucher_info['prefix']}{$voucher_info['serial_number']}" disabled>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="country_name">Country</label>
                                    <div class="col-md-4">
                                        <input type="text" name="country_name" class="form-control" id="country_name" value="{$voucher_info['country_name']}" disabled>
                                    </div>

                                    <label class="col-md-2 control-label" for="category">Category</label>
                                    <div class="col-md-4">
                                        <input type="text" name="category" class="form-control" id="category" value="{$voucher_info['category']}" disabled>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="customer_name">Name</label>
                                    <div class="col-md-10">
                                        <input type="text" name="customer_name" class="form-control" id="customer_name" value="{$customer_data['account']}" disabled>
                                    </div>
                                </div>

                                {if $page_setting['address'] eq 1}
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="customer_address">Address</label>
                                    <div class="col-md-10">
                                        <textarea id="customer_address" name="customer_address" class="form-control" rows="3" disabled>{$customer_addr}</textarea>
                                    </div>
                                    <span class="col-md-offset-2 help-block" style="padding-left: 30px">Your address is editable from your profile page.</span>
                                </div>
                                {/if}

                                {if $page_setting['date_range'] eq 1}
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="departure_date">Departure Date</label>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" value="" name="departure_date" id="departure_date" datepicker data-date-format="yyyy-mm-dd" data-auto-close="true">
                                    </div>

                                    <label class="col-md-2 control-label" for="category">Return Date</label>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" value="" name="return_date" id="return_date" datepicker data-date-format="yyyy-mm-dd" data-auto-close="true">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="total_days">Total Days</label>
                                    <div class="col-md-4">
                                        <input type="text" name="total_days" class="form-control" id="total_days" value="" disabled>
                                    </div>
                                </div>
                                {/if}
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="remark">Remark</label>
                                    <div class="col-md-10">
                                        <textarea id="remark" name="remark" class="form-control" rows="3"></textarea>
                                    </div>
                                </div>

                                {foreach $fs as $f}

                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="cf{$f['id']}">{$f['fieldname']}</label>
                                        {if ($f['fieldtype']) eq 'text'}


                                            <div class="col-lg-10">
                                                <input type="text" id="cf{$f['id']}" name="cf{$f['id']}" class="form-control"> {if ($f['description']) neq ''}
                                                    <span class="help-block">{$f['description']}</span>
                                                {/if}

                                            </div>

                                        {elseif ($f['fieldtype']) eq 'password'}

                                            <div class="col-lg-10">
                                                <input type="password" id="cf{$f['id']}" name="cf{$f['id']}" class="form-control"> {if ($f['description']) neq ''}
                                                    <span class="help-block">{$f['description']}</span>
                                                {/if}
                                            </div>

                                        {elseif ($f['fieldtype']) eq 'dropdown'}
                                            <div class="col-lg-10">
                                                <select id="cf{$f['id']}" name="cf{$f['id']}" class="form-control" style="width:100%">
                                                    <option value=""></option>
                                                    {foreach explode(',',$f['fieldoptions']) as $fo}
                                                        <option value="{$fo}">{$fo}</option>
                                                    {/foreach}
                                                </select>
                                                {if ($f['description']) neq ''}
                                                    <span class="help-block">{$f['description']}</span>
                                                {/if}
                                            </div>


                                        {elseif ($f['fieldtype']) eq 'textarea'}

                                            <div class="col-lg-10">
                                                <textarea id="cf{$f['id']}" name="cf{$f['id']}" class="form-control" rows="3"></textarea> {if ($f['description']) neq ''}
                                                    <span class="help-block">{$f['description']}</span>
                                                {/if}
                                            </div>

                                        {elseif ($f['fieldtype']) eq 'date'}

                                            <div class="col-lg-10">
                                                <input type="text" id="cf{$f['id']}" name="cf{$f['id']}" class="form-control" datepicker data-date-format="yyyy-mm-dd" data-auto-close="true"> {if ($f['description']) neq ''}
                                                    <span class="help-block">{$f['description']}</span>
                                                {/if}
                                            </div>
                                        {else} {/if}
                                    </div>
                                {/foreach}

                                {if $page_setting['payment_req'] eq '1' && $page_setting['product_id'] neq '0'}
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <div class="col-md-offset-2 col-md-6" style="text-align:left">
                                        {$product_data['name']}
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" min="1" id="product_quantity" name="product_quantity" class="form-control" value="{$page_setting['product_quantity']}">
                                        <span class="help-block">
                                            &nbsp;&nbsp;&nbsp;&nbsp;Quantity
                                        </span>
                                    </div>
                                    <div class="col-md-2" style="text-align: right">
                                        <span class="amount product_price" style="font-weight: 600" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" data-d-group="2">{$product_data['sales_price']}</span>
                                    </div>
                                </div>
                                {/if}

                                {if $page_setting['sub_product_id'] neq '0'}
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <div class="col-md-2" style="text-align:right">
                                        <input type="checkbox" class="i-checks" id="sub_product_req" name="sub_product_req" value="1" checked>
                                    </div>
                                    <div class="col-md-6" style="text-align: left">
                                        {$sub_product_data['name']}
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" min="1" id="sub_product_quantity" name="sub_product_quantity" class="form-control" value="{$page_setting['sub_product_quantity']}" >
                                        <span class="help-block">
                                            &nbsp;&nbsp;&nbsp;&nbsp;Quantity
                                        </span>
                                    </div>
                                    <div class="col-md-2" style="text-align: right">
                                        <span class="amount sub_product_price" style="font-weight: 600" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" data-d-group="2">{$sub_product_data['sales_price']}</span>
                                    </div>
                                </div>
                                {/if}

                                {if $page_setting['payment_req'] eq '1' && $page_setting['product_id'] neq '0'}
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <div class="col-md-10" style="text-align: right">
                                        <span style="font-size: 12pt; font-weight: 600">Total :</span>
                                    </div>
                                    <div class="col-md-2" style="text-align: right">
                                        <span class="amount total_price" style="font-weight: 600" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" data-d-group="2">{$product_data['sales_price']+$sub_product_data['sales_price']}</span>
                                    </div>
                                </div>
                                {/if}

                                {*<div class="form-group">*}
                                    {*<label class="col-md-2 control-label" for="status">Status</label>*}

                                    {*<div class="col-md-4">*}
                                        {*<select class="form-control" id="status" name="status" {if $type eq 'view'}disabled{/if}>*}
                                            {*<option value="Redeem" {if $transaction_data['status'] eq 'Redeem'}selected{/if}>Redeem</option>*}
                                            {*<option value="Processing" {if $transaction_data['status'] eq 'Processing'}selected{/if}>Processing</option>*}
                                            {*<option value="Confirm" {if $transaction_data['status'] eq 'Confirm'}selected{/if}>Confirm</option>*}
                                        {*</select>*}
                                    {*</div>*}
                                {*</div>*}



                                <input type="hidden" id="voucher_id" name="voucher_id" value="{$voucher_id}">
                                <input type="hidden" id="page_id" name="page_id" value="{$page_id}">
                                <input type="hidden" id="page_title" name="page_title" value="{$page_setting['title']}">
                                <input type="hidden" id="product_name" name="product_name" value="{$product_data['name']}">
                                <input type="hidden" id="product_price" name="product_price" value="{$product_data['sales_price']}">
                                <input type="hidden" id="sub_product_name" name="sub_product_name" value="{$sub_product_data['name']}">
                                <input type="hidden" id="sub_product_price" name="sub_product_price" value="{$sub_product_data['sales_price']}">
                                <input type="hidden" id="require_agree" name="require_agree" value="{$setting['require_agree']}">
                                <input type="hidden" id="invoice_id" name="invoice_id" value="">
                                <input type="hidden" id="currency_code" name="currency_code" value="{$config['currency_code']}">

                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <div class="col-md-offset-10 col-md-2" style="text-align: right">
                                        <button type="submit" id="redeem_submit" class="btn btn-primary">Redeem</button>
                                    </div>
                                </div>

                                <br>
                            </form>

                        </div>
                    </div>


                </div>
            </div>

        </div>


    </div> <!-- Row end-->


{/block}

{block name=script}
    <script>
        $(function() {

            $('.amount').autoNumeric('init', {

                aSign: '{$config['currency_code']} ',
                dGroup: {$config['thousand_separator_placement']},
                aPad: {$config['currency_decimal_digits']},
                pSign: '{$config['currency_symbol_position']}',
                aDec: '{$config['dec_point']}',
                aSep: '{$config['thousands_sep']}',
                vMax: '9999999999999999.00',
                vMin: '-9999999999999999.00'

            });

            var _url = $('#_url').val();

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue'
            });


            var product_price;
            var sub_product_price;

            var change_prices = function(){
                product_price = parseFloat($('#product_price').val()* $('#product_quantity').val()+0.00);
                sub_product_price = parseFloat($('#sub_product_price').val() * $('#sub_product_quantity').val()+0.00);

                $('.product_price').html($('#currency_code').val() + ' ' + product_price);
                $('.sub_product_price').html($('#currency_code').val() + ' ' + sub_product_price);

                var isChecked = $("#sub_product_req").prop("checked");

                if(isChecked == true){
                    var total_price = product_price + sub_product_price;
                }else{
                    var total_price = product_price;
                }

                // total_price = total_price.toLocaleString();

                var total_price = $('#currency_code').val() + ' ' + total_price;
                $('.total_price').html(total_price);

            };

            change_prices();

            $('#product_quantity').on('change', function(){
                change_prices();
            });

            $('#sub_product_quantity').on('change', function(){
                change_prices();
            });


            $('#sub_product_req').on('ifChanged', function(e) {
                e.preventDefault();

                var isChecked = e.currentTarget.checked;

                if(isChecked == true){
                    var total_price = product_price + sub_product_price;
                }else{
                    var total_price = product_price;
                }

                // total_price = total_price.toLocaleString();
                var total_price = $('#currency_code').val() + ' ' + total_price;
                $('.total_price').html(total_price);

            });

            $.fn.modal.defaults.width = '800px';
            $('[data-toggle="tooltip"]').tooltip();
            var $modal = $('#ajax-modal');

            var require_agree = $('#require_agree').val();


            var calc_totaldays = function(){
                var departure_date = $('#departure_date').val();
                var return_date = $('#return_date').val();
                var total_days = '';

                if(departure_date != '' && return_date != '' ){
                    departure_date = departure_date.split('-');
                    departure_date = new Date(departure_date[0], departure_date[1]-1, departure_date[2]);

                    return_date = return_date.split('-');
                    return_date = new Date(return_date[0], return_date[1]-1, return_date[2]);

                    if(return_date>departure_date){
                        total_days = (return_date-departure_date)/(1000*60*60*24);
                    }
                    $('#total_days').val(total_days);
                }

            };

            $('#departure_date').on('change', function(e) {
                e.preventDefault();
                var departure_date = $('#departure_date').val();
                departure_date = departure_date.split('-');

                var min_date = new Date(departure_date[0], departure_date[1]-1, departure_date[2]);

                calc_totaldays();

            });

            $('#return_date').on('change', function(e) {
                e.preventDefault();
                calc_totaldays();
            });


            $('#redeem_submit').on('click', function(e) {

                e.preventDefault();

                if(require_agree != 1){

                    $('#voucher_number').prop('disabled', false);
                    $('#country_name').prop('disabled', false);
                    $('#category').prop('disabled', false);
                    $('#customer_name').prop('disabled', false);
                    $('#customer_address').prop('disabled', false);
                    $('#total_days').prop('disabled', false);


                    $.post(_url + 'voucher/client/post_redeem_page', $("#frm_redeem").serialize())
                        .done(function (data) {
                            if(data == 'page_list') {
                                var voucher_id = $('#voucher_id').val();
                                window.location = base_url + 'voucher/client/voucher_page/'+voucher_id;
                            }else if(data == 'reload') {
                                // toastr.error(data);
                                $('#voucher_number').prop('disabled', true);
                                $('#country_name').prop('disabled', true);
                                $('#category').prop('disabled', true);
                                $('#customer_name').prop('disabled', true);
                                $('#customer_address').prop('disabled', true);
                                $('#total_days').prop('disabled', true);
                            }else{
                                window.location.href = data;
                            }
                        });
                }else {
                    $('body').modalmanager('loading');

                    $modal.load(_url + 'voucher/client/confirm_redeem', '', function () {

                        $modal.modal();
                        $modal.css("width", "800px");
                        $modal.css("margin-left", "-349px");

                    });
                }

            });

            $modal.on('click', '.modal_submit', function (e) {

                e.preventDefault();

                if($('#modal_agree_check').prop('checked') ){

                    $('#voucher_number').prop('disabled', false);
                    $('#country_name').prop('disabled', false);
                    $('#category').prop('disabled', false);
                    $('#customer_name').prop('disabled', false);
                    $('#customer_address').prop('disabled', false);
                    $('#total_days').prop('disabled', false);

                    $modal.modal('loading');

                    $.post(_url + 'voucher/client/post_redeem_page', $("#frm_redeem").serialize())
                        .done(function (data) {
                            if (data == 'page_list') {
                                var voucher_id = $('#voucher_id').val();

                                window.location = base_url + 'voucher/client/voucher_page/'+voucher_id;

                            }else if(data == 'reload'){
                                // toastr.error(data);
                                window.location.reload();

                                $('#voucher_number').prop('disabled', true);
                                $('#country_name').prop('disabled', true);
                                $('#category').prop('disabled', true);
                                $('#customer_name').prop('disabled', true);
                                $('#customer_address').prop('disabled', true);
                                $('#total_days').prop('disabled', true);

                            }else{
                                window.location.href = data;
                            }
                        });
                } else {
                    window.location.reload();
                }

            });



        });

    </script>

{/block}