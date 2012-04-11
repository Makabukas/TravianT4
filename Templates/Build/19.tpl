<h1 class="titleInHeader">Kaszárnya <span class="level">szint <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid19">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(19,4);" class="build_logo">
	<img class="building big white g19" src="img/x.gif" alt="Kaszárnya" title="Kaszárnya" />
</a>
A kaszárnyában gyalogosokat képeznek. Minél nagyobb szintű az épület, a folyamat annál gyorsabb. Amennyiben fejletteb csapatokat szeretnél képezni, azokat ki kell fejleszteni az Akadémiában.</div>
<?php
include("upgrade.tpl");
?>
<div class="clear"></div>
<?php if ($building->getTypeLevel(19) > 0) { ?>
<form method="POST" name="snd" action="build.php">
				<input type="hidden" name="id" value="<?php echo $id; ?>" />
				<input type="hidden" name="ft" value="t1" />
			<div class="buildActionOverview trainUnits">
                <?php
	                include("19_train.tpl");
                ?>
                <div class="clear"></div></div>
    <button type="submit" value="ok" name="s1" id="btn_train" value="ok" class="startTraining"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Kiképzés</div></div></button>
</form>
						
    <?php
	} else {
		echo "<b>A képzések elkezdhetőek, ha a kaszárnya kiépült.</b><br>\n";
	}
    $trainlist = $technology->getTrainingList(1);
    if(count($trainlist) > 0) {
    //$timer = 2*count($trainlist);
    	echo "
        <h4 class=\"round spacer\">Kiképzés</h4>
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Kiképzés alatt</td>
			<td>Időtartam</td>
			<td>Kész</td>
		</tr></thead>
		<tbody>";
		$TrainCount = 0;
        foreach($trainlist as $train) {
			$TrainCount++;
	        echo "<tr><td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />";
			echo $train['amt']." ".$train['name']."</td><td class=\"dur\">";
			if ($TrainCount == 1 ) {
				$NextFinished = $generator->getTimeFormat(($train['commence']+$train['eachtime'])-time());
				echo "<span id=timer1>".$generator->getTimeFormat(($train['commence']+($train['eachtime']*$train['amt']))-time())."</span>";
			} else {
				echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
			}
			echo "</td><td class=\"fin\">";
			$time = $generator->procMTime($train['commence']+($train['eachtime']*$train['amt']));
			echo " ".$time[1]." óra";
		} ?>
		</tr><tr class="next"><td colspan="3">A következő egység <span id="timer2"><?php echo $NextFinished; ?></span> múlva lesz kész</td></tr>
		</tbody></table>

<?php } ?>
</p></div>
    <div class="clear">&nbsp;</div>
    <div class="clear"></div>