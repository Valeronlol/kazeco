<?php echo $header; ?>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({height: 300});
    });
</script>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $line_list; ?></h3>
            </div>
            <div class="panel-body">
                <?php if($validation_errors): ?>
                <?php foreach($validation_errors as $message): ?>
                <p class="text-danger"><?= $message; ?></p>
                <? endforeach; ?>
                <?php endif; ?>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="">Код</label>
                        <div class="col-sm-10">
                            <input type="text" name="code" value="<?=$line_data['code']; ?>" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="">Контент</label>
                        <div class="col-sm-10">
                            <textarea name="content" id="summernote" class="form-control"><?=$line_data['content']; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status">Статус</label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" <?= ($line_data['status']) ? 'checked' : ''; ?> name="status" value="1" id="input-top">
                                    &nbsp; </label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="<?= $line_data['id']?>" />
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>