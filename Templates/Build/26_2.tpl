<h1 class="titleInHeader">Palota <span class="level">Szint <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid26">
<div class="build_desc">
	<a href="#" onClick="return Travian.Game.iPopup(26,4, 'gid');" class="build_logo"> 
    <img class="building big white g26" src="img/x.gif" alt="Palota" title="Palota" /> </a>
	A palotában a birodalom uralkodója lakik. Ha a faluban van egy palota, akkor a falu kinevezhető főfalunak.</div>

<?php 
include("upgrade.tpl");
include("26_menu.tpl"); 
?>

<p>A kulturális pontok (KP) jelentik a korlátozást abban, hogy mennyi falu alapítható vagy foglalható. A kulturális pontokat épületek építésével lehet szerezni.</p>

<table cellpadding="1" cellspacing="1" id="build_value">
<tr>
	<th>Ennek a falunak a kultúrpont termelése:</th>
	<td><b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> naponta</td>
</tr>
<tr>
	<th>Összes falud kultúrpont termelése:</th>
	<td><b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> naponta</td>
</tr>
</table><p>Következő falu alapításához <b><?php $mode = CP; $total = count($database->getProfileVillages($session->uid)); echo ${'cp'.$mode}[$total+1]; ?></b> kultúrpontra van szükséged. Eddig a falvaid összesen <b><?php echo $database->getUserField($session->uid, 'cp',0); ?></b> kultúrpontot termeltek neked. </p>
</div>
