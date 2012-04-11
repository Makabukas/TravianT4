<h1 class="titleInHeader">Piac <span class="level">szint <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid17">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(17,4);" class="build_logo"> 
	<img class="building big white g17" src="img/x.gif" alt="Piac" title="Piac" /> 
</a> 
A piacon keresztül tudsz más játékosokkal kereskedni. Az épület szintje dönti el, egyszerre mennyi kereskedő áll rendelkezésedre.</div> 
<?php
include("upgrade.tpl");
include("17_menu.tpl");
?>
<div class="boxes boxesColor gray traderCount"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">Kereskedő <?php echo $market->merchant; ?> / <?php echo $market->merchantAvail(); ?></div></div><div class="clear"></div>

<form method="POST" name="snd" action="build.php"> 
			<input type="hidden" name="id" value="<?php echo $id; ?>"> 
			<input type="hidden" name="ft" value="mk2"> 
			<input type="hidden" name="t" value="<?php echo $_GET['t']; ?>"> 
 
<table id="sell" cellpadding="1" cellspacing="1"> 
<tr> 
	<th>Eladás</th> 
	<td class="val"><input class="text" tabindex="1" name="m1" value="" maxlength="6" /></td> 
	<td class="res"> 
		<select name="rid1" tabindex="2" class="dropdown"> 
			<option value="1" selected="selected">Fa</option> 
			<option value="2">Agyag</option> 
			<option value="3">Vasérc</option> 
			<option value="4">Búza</option> 
		</select> 
	</td> 
	<td class="tra"><input class="check" type="checkbox" tabindex="5" name="d1" value="1" /> Maximum távolság: <input class="text" tabindex="6" name="d2" value="2" maxlength="2" /> óra</td>
</tr> 
<tr> 
	<th>Keresés</th> 
	<td class="val"><input class="text" tabindex="3" name="m2" value="" maxlength="6" /></td> 
	<td class="res"> 
		<select name="rid2" tabindex="4" class="dropdown"> 
			<option value="1">Fa</option> 
			<option value="2" selected="selected">Agyag</option> 
			<option value="3">Vasérc</option> 
			<option value="4">Búza</option> 
		</select> 
	</td> 
	<td class="al">
    <?php 
    if($session->plus) {
    echo "<input class=\"check\" type=\"checkbox\" tabindex=\"7\" name=\"ally\" value=\"1\" /> Csak saját klán";
    }
    ?> 
    </td>
</tr> 
</table>
<button type="submit" value="ok" name="s1" id="btn_ok" tabindex="8"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Kész</div></div></button></form><br />
<?php if(count($market->onmarket) > 0) { ?>
<h4 class="spacer">Eladás</h4>
<table id="sell_overview" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td>&nbsp;</td>
			<td>Felajánlás</td>
			<th><img src="img/x.gif" class="ratio" title="نسبت"></th>
			<td>Keres</td>
            <?php if($session->plus){ ?><td>Saját&nbsp;klán</td><?php } ?>
			<td>Kereskedő</td>
			<td>Max.&nbsp;táv.</td>
		</tr>
	</thead>
	<tbody>
<?php foreach($market->onmarket as $offer) { ?>
    <tr>
			<td class="abo"><a href="build.php?id=<?php echo $id; ?>&t=<?php echo $_GET['t']; ?>&a=5&del=<?php echo $offer['id']; ?>"><img class="del" src="img/x.gif" alt="Mégse"></a></td>
			<td class="val">
<?php
	switch($offer['gtype']) {
		case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"Fa\" title=\"Fa\" /> "; break;
		case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"Agyag\" title=\"Agyag\" /> "; break;
		case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"Vasérc\" title=\"Vasérc\" /> "; break;
		case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"Búza\" title=\"Búza\" /> "; break;
	}
	echo $offer['gamt'];
    
    $sss = ($offer['wamt']/$offer['gamt']);
        $ratio = round($sss, 1);
        if($ratio <= 1){
        	$class = 'red';
        }elseif($ratio > 1 && $ratio < 2){
        	$class = 'orange';
        }elseif($ratio >= 2){
        	$class = 'green';
        }	
?></td>
			<td class="ratio">
				<div class="boxes boxesColor <?php echo $class; ?>"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents cf">
				<?php echo $ratio; ?>
					</div>
				</div>

				</td>

			<td class="val">
<?php
	switch($offer['wtype']) {
		case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"Fa\" title=\"Fa\" /> "; break;
		case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"Agyag\" title=\"Agyag\" /> "; break;
		case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"Vasérc\" title=\"Vasérc\" /> "; break;
		case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"Búza\" title=\"Búza\" /> "; break;
	}
	echo $offer['wamt'];		
?></td>
			<?php if($session->plus){ ?><td class="al"><?php echo ($offer['alliance'] == 0)? 'Nem' : 'Igen'; ?></td><?php } ?>
			<td class="tra"><?php echo $offer['merchant']; ?></td>
			<td class="dur"><?php
        if($offer['maxtime'] != 0) {
        	echo $offer['maxtime']/3600;
        	echo " óra";
        }else { echo "-"; }
			?></td>
            
		</tr>
		<?php } ?>
		</tbody>
</table>
<?php } ?>
</div> 