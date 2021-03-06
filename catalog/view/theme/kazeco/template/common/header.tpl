<!doctype html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="description" content="Описание сайте">
  <meta name="keywords" content="Мета теги">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="media/app/Libs/bootstrap-3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="media/app/Libs/slick/slick.css">
  <link rel="stylesheet" href="media/app/css/styles.css">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <meta name="description" content="<?php echo $description; ?>" />
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
</head>
<body class="<?php echo $class; ?>">
<!--[if lt IE 10]>
<p class="browserupgrade">Ваш браузер устарел более чем полностью. Чтобы продолжить просмотр данной страницы скачайте актуальный браузер, например отсюда: <a href="http://browsehappy.com/"></p>
<![endif]-->