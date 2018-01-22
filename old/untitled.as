package  { 
	import com.greensock.*;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import com.greensock.plugins.*;
	import com.greensock.easing.*;
	
	TweenPlugin.activate([TintPlugin]);
	
	var timeline:TimelineLite = new TimelineLite();
	
	// кнопка для запуска анимации
	
	_root.createEmptyMovieClip("links",_root.getNextHighestDepth());
	_root.links.x = 994;
	_root.links.y = 738;
	
	with(_root.links)
	{
		s = 6;
		
		_root.links.createEmptyMovieClip("filling",1);
		with(_root.links.filling)
		{
		
		graphics.beginFill(0xF27C2F,100);
		graphics.moveTo(-s,s);
		graphics.lineTo(s,s);
		graphics.lineTo(s,-s);
		graphics.lineTo(-s,-s);
		graphics.lineTo(-s,s);
		graphics.endFill();
		}
		
		_root.links.createEmptyMovieClip("filling_outline",2);
		with(_root.links.filling_outline)
		{
		graphics.lineStyle(0.5,0xffffff);
		
		graphics.moveTo(-s,s);
		graphics.lineTo(s,s);
		graphics.lineTo(s,-s);
		graphics.lineTo(-s,-s);
		graphics.lineTo(-s,s);
		}
		_root.links.filling.alpha = 0;
	}
	_root.links.filling.onRollOver = function () {
		_root.links.filling.alpha = 100;
		
	}
	_root.links.filling.onRollOut = function () {
		_root.links.filling.alpha = 0;
	
	}
	
	
	//координаты контейнера для текста
	p0x = 110;
	p0y = 0;
	
	p1x = -500;
	p1y = 0;
	
	p2x = 0;
	p2y = 0;
	
	p3x = 0;
	p3y = 644;
	
	p4x = -500;
	p4y = 644;
	
	shadow_offset = 5;
	grad_height = 30;
	
		s1 = 6;
		s2 = 2;
		d_txt = 10;
		d_shadow = 3;
		
	//координаты контейнеров для изображений справа
	var pics_x:Array = [30,270,270,30,30,270,270,30,30,270,270,30];
	var pics_y:Array = [174,174,324,324,334,334,484,484,494,494,644,644];
	
	
	_root.createEmptyMovieClip("text_container",_root.getNextHighestDepth());
	_root.text_container.x = 627;
	_root.text_container.y = 70;
	
		//клипы по которым отрисовывается обводка поля 
		_root.text_container.createEmptyMovieClip("txt_point0",_root.text_container.getNextHighestDepth());
		_root.text_container.createEmptyMovieClip("txt_point1",_root.text_container.getNextHighestDepth());
		_root.text_container.createEmptyMovieClip("txt_point2",_root.text_container.getNextHighestDepth());
		_root.text_container.createEmptyMovieClip("txt_point3",_root.text_container.getNextHighestDepth());
		_root.text_container.createEmptyMovieClip("txt_point4",_root.text_container.getNextHighestDepth());
	
	_root.text_container.createEmptyMovieClip("text_canvas",_root.text_container.getNextHighestDepth());
	
	
	_root.text_container.createEmptyMovieClip("text_fields",_root.text_container.getNextHighestDepth());
	_root.text_container.createEmptyMovieClip("text_mask",100);
	
	_root.text_container.text_fields.setMask(_root.text_container.text_mask);
	
	//текстовые поля
	_root.text_container.text_fields.text_content_1 = new TextField();
	_root.text_container.text_fields.addChildAt(_root.text_container.text_fields.text_content_1, _root.text_container.getNextHighestDepth());
	_root.text_container.text_fields.text_content_1.x = (p1x+d_txt);
	_root.text_container.text_fields.text_content_1.y = (p1y+d_txt);
	_root.text_container.text_fields.text_content_1.width = (-3*d_txt-p1x);
	_root.text_container.text_fields.text_content_1.height = (p3y-2*d_txt);
	
	_root.text_container.text_fields.text_content_2 = new TextField();
	_root.text_container.text_fields.addChildAt(_root.text_container.text_fields.text_content_2, _root.text_container.getNextHighestDepth()+1);
	_root.text_container.text_fields.text_content_2.x = (d_txt);
	_root.text_container.text_fields.text_content_2.y = (p1y+d_txt);
	_root.text_container.text_fields.text_content_2.width = (-3*d_txt-p1x);
	_root.text_container.text_fields.text_content_2.height = (p3y-2*d_txt);
	
	
	//градиенты над текстом поля
	_root.text_container.createEmptyMovieClip("text_gradient_top",_root.text_container.getNextHighestDepth());
	_root.text_container.createEmptyMovieClip("text_gradient_bottom",_root.text_container.getNextHighestDepth());
	
	_root.text_container.text_gradient_top.alpha = 0;
	_root.text_container.text_gradient_bottom.alpha = 0;
	
	//тень на поле
	_root.text_container.createEmptyMovieClip("canvas_shadow",_root.text_container.getNextHighestDepth());
	_root.text_container.canvas_shadow.alpha = 0;
	
	_root.text_container.createEmptyMovieClip("text_border",_root.text_container.getNextHighestDepth());
	_root.text_container.text_border.createEmptyMovieClip("scroll_bar",_root.text_container.text_border.getNextHighestDepth());
	
	
	_root.text_container.createEmptyMovieClip("pics",_root.text_container.getNextHighestDepth());
	/*_root.text_container.createEmptyMovieClip("pic_1",_root.text_container.getNextHighestDepth());
	_root.text_container.createEmptyMovieClip("pic_2",_root.text_container.getNextHighestDepth());
	_root.text_container.createEmptyMovieClip("pic_3",_root.text_container.getNextHighestDepth());*/
	
	for(var i = 0;i<pics_x.length;i++)
	{
		_root.text_container.createEmptyMovieClip("pic_point_"+i,i+15);
		_root.text_container["pic_point_"+i].x = pics_x[i];
		_root.text_container["pic_point_"+i].y = pics_y[i];
	}
	//_root.text_container.pics.alpha =0;
	
	/*var txt_params_x:Array = [];
	var txt_params_y:Array = [];
	*/
	
	
		
		
	function sq (mc)
		{
			with(mc)
			{
			s=3;
			graphics.lineStyle(1,0x000000);
			graphics.moveTo(-s,s);
			graphics.lineTo(s,s);
			graphics.lineTo(s,-s);
			graphics.lineTo(-s,-s);
			graphics.lineTo(-s,s);
			}
		}
		
	function create_animation ()
	{
		//для изображений
		_root.text_container.pic_point_0.x = pics_x[0];
		_root.text_container.pic_point_0.y = pics_y[0];
		
		_root.text_container.pic_point_1.x = pics_x[0];
		_root.text_container.pic_point_1.y = pics_y[0];
		
		_root.text_container.pic_point_2.x = pics_x[0];
		_root.text_container.pic_point_2.y = pics_y[0];
		
		_root.text_container.pic_point_3.x = pics_x[0];
		_root.text_container.pic_point_3.y = pics_y[0];
		
		_root.text_container.pic_point_4.x = pics_x[4];
		_root.text_container.pic_point_4.y = pics_y[4];
		
		_root.text_container.pic_point_5.x = pics_x[4];
		_root.text_container.pic_point_5.y = pics_y[4];
		
		_root.text_container.pic_point_6.x = pics_x[4];
		_root.text_container.pic_point_6.y = pics_y[4];
		
		_root.text_container.pic_point_7.x = pics_x[4];
		_root.text_container.pic_point_7.y = pics_y[4];
		
		_root.text_container.pic_point_8.x = pics_x[8];
		_root.text_container.pic_point_8.y = pics_y[8];
		
		_root.text_container.pic_point_9.x = pics_x[8];
		_root.text_container.pic_point_9.y = pics_y[8];
		
		_root.text_container.pic_point_10.x = pics_x[8];
		_root.text_container.pic_point_10.y = pics_y[8];
		
		_root.text_container.pic_point_11.x = pics_x[8];
		_root.text_container.pic_point_11.y = pics_y[8];
		
		
		//для контейнера текста
		_root.text_container.txt_point0.x = 110;
		_root.text_container.txt_point0.y = 0;
		
		_root.text_container.txt_point1.x = 0;
		_root.text_container.txt_point1.y = 0;
		
		_root.text_container.txt_point2.x = 0;
		_root.text_container.txt_point2.y = 0;
		
		_root.text_container.txt_point3.x = 0;
		_root.text_container.txt_point3.y = 0;
		
		_root.text_container.txt_point4.x = 0;
		_root.text_container.txt_point4.y = 0;
		
		
		//тень на фоне
		with(_root.text_container.canvas_shadow)
			{
			graphics.beginFill(0x000000, 10);
			graphics.moveTo(p1x,p1y);
			graphics.lineTo(p2x,p2y);
			graphics.lineTo(p2x,p2y+shadow_offset);
			graphics.lineTo(p1x+shadow_offset,p1y+shadow_offset);
			graphics.lineTo(p4x+shadow_offset,p4y);
			graphics.lineTo(p4x,p4y);
			graphics.lineTo(p1x,p1y);
		
			graphics.endFill();
			}
		
		_root.text_container.text_border.scroll_bar.alpha =0;
		
		//тень от ползунока
		_root.text_container.text_border.scroll_bar.createEmptyMovieClip("sq_shadow",1);
		_root.text_container.text_border.scroll_bar.sq_shadow.x = d_shadow;
		_root.text_container.text_border.scroll_bar.sq_shadow.y = d_shadow;	
		//ползунок
		_root.text_container.text_border.scroll_bar.createEmptyMovieClip("bar_sq",10);
		_root.text_container.text_border.scroll_bar.x = p2x-d_txt;
		_root.text_container.text_border.scroll_bar.y = p2y+s1+d_txt;
		//верхний ограничитель скроллбара
		_root.text_container.text_border.createEmptyMovieClip("bar_line_top",5);
		_root.text_container.text_border.bar_line_top.x = -d_txt;
		_root.text_container.text_border.bar_line_top.y = +d_txt;
		_root.text_container.text_border.bar_line_top.alpha = 0;
		//нижний ограничитель скроллбара
		_root.text_container.text_border.createEmptyMovieClip("bar_line_bottom",6);
		_root.text_container.text_border.bar_line_bottom.x = -d_txt;
		_root.text_container.text_border.bar_line_bottom.y = p3y-d_txt;
		_root.text_container.text_border.bar_line_bottom.alpha = 0;
	
		//настройки для текста
		_root.text_container.text_fields.text_content_1.multiline = true;
		_root.text_container.text_fields.text_content_2.multiline = true;
		
		_root.text_container.text_fields.text_content_1.wordWrap = true;
		_root.text_container.text_fields.text_content_2.wordWrap = true;
		
		_root.text_container.text_fields.text_content_1.mouseWheelEnabled = true;
		_root.text_container.text_fields.text_content_2.mouseWheelEnabled = true;
		
		//_root.text_container.text_fields.text_content_1.embedFonts = true;
		//_root.text_container.text_fields.text_content_1.embedFonts = true;
		
		//_root.text_container.text_fields.text_content_1.border = true;
		
		public var my_fmt:TextFormat = new TextFormat();
		my_fmt.color = 0xffffff;
		
		my_fmt.font = "verdana";
		my_fmt.size = 12;
		my_fmt.align = "left";
	
		my_fmt.leftMargin = 0;
		my_fmt.rightMargin = 0;
		
		_root.text_container.text_fields.text_content_1.alpha = 0;
		_root.text_container.text_fields.text_content_2.alpha = 0;
		
		//var text_aplha:Tween = new Tween(_root.text_container.text_content,"alpha",Regular.easeInOut, 0,100, 1.5, true);	
	
		_root.text_container.text_fields.text_content_1.text = "Климат"+newline+""+newline+"Климат Кубы — тропический, пассатный. Среднегодовая температура составляет 25,5 °C. Средняя температура самого холодного месяца (январь) равна 22,5 °C и самого жаркого (август) — 27,8 °C. Температура поверхностных вод у берегов зимой составляет 22-24 °, летом — 28-30 °C. Среднегодовое количество осадков, выпадающих обычно в виде ливней — 1400 мм, однако нередко случаются и засушливые годы. На Кубе четко выражены два климатических сезона: дождливый (май-октябрь) и сухой (ноябрь-апрель). На сезон дождей приходится 3/4 всей годовой суммы осадков. Особенностью климата Кубы является типичная высокая влажность на протяжении всего года. Сочетание большой влажности и высокой температуры оказывает в целом неблагоприятное влияние на жизнь людей. Однако на побережье ветер с моря умеряет жару, приносит свежесть, а по вечерам и прохладу. В любом месте ветры отличаются известным постоянством, поэтому часто можно видеть деревья, стволы которых имеют и соответствующий наклон. Куба под	вержена действию тропических циклонов, которые зарождаются в летне-осенний период (июнь — середина ноября) к востоку от Малых Антильских островов и на западе Карибского моря, передвигаясь затем в сторону Флориды. Тайфуны сопровождаются обильными ливнями и сильнейшими ветрами, способными причинить большой ущерб хозяйству и населению острова. Реки на Кубе короткие, немноговодные. Леса, покрывающие около 10 % территории, сохранились лишь в горных и заболоченных районах. Животный мир суши относительно бедный. В то же время в окружающих Кубу водах имеются ценные промысловые рыбы, моллюски, лангусты, креветки, а также губки."+newline+""+newline+"Рельеф"+newline+""+newline+"Рельеф Кубы преимущественно равнинный. Возвышенности и горы занимают около трети территории. Самый высокий горный массив Сьерра–Маэстра протянулся вдоль юго-восточного побережья на 250 км. Его высшая точка — пик Туркино (1972 м). Расположенные на западе острова живописные невысокие горы причудливо рассечены и слабо заселены. На Кубе повсеместно развит карст, в связ	и с этим известно множество пещер, в том числе и крупных. Так, на западе пещера Санто-Томас имеет разветвленную сеть подземных галерей общей протяженностью 25 км. Часто встречаются так называемые «моготес» — формы тропического карста, представляющие собой возвышенности с почти вертикальными склонами и плоскими вершинами. Примерно 2/3 всей площади Кубы занимают слегка всхолмленные равнины. Они наиболее заселены и освоены. Берега, как правило, низкие, иногда заболоченные, во многих случаях поросшие мангровыми зарослями. Часто встречаются песчаные пляжи, которые тянутся на многие километры (например, на полуострове Икакос, где расположен известный курорт Варадеро)."+newline+""+newline+"Климат"+newline+""+newline+"Климат Кубы — тропический, пассатный. Среднегодовая температура составляет 25,5 °C. Средняя температура самого холодного месяца (январь) равна 22,5 °C и самого жаркого (август) — 27,8 °C. Температура поверхностных вод у берегов зимой составляет 22-24 °, летом — 28-30 °C. Среднегодовое количество осадков, выпадающих обычно в виде лив	ней — 1400 мм, однако нередко случаются и засушливые годы. На Кубе четко выражены два климатических сезона: дождливый (май-октябрь) и сухой (ноябрь-апрель). На сезон дождей приходится 3/4 всей годовой суммы осадков. Особенностью климата Кубы является типичная высокая влажность на протяжении всего года. Сочетание большой влажности и высокой температуры оказывает в целом неблагоприятное влияние на жизнь людей. Однако на побережье ветер с моря умеряет жару, приносит свежесть, а по вечерам и прохладу. В любом месте ветры отличаются известным постоянством, поэтому часто можно видеть деревья, стволы которых имеют и соответствующий наклон. Куба подвержена действию тропических циклонов, которые зарождаются в летне-осенний период (июнь — середина ноября) к востоку от Малых Антильских островов и на западе Карибского моря, передвигаясь затем в сторону Флориды. Тайфуны сопровождаются обильными ливнями и сильнейшими ветрами, способными причинить большой ущерб хозяйству и населению острова. Реки на Кубе короткие, немног	оводные. Леса, покрывающие около 10 % территории, сохранились лишь в горных и заболоченных районах. Животный мир суши относительно бедный. В то же время в окружающих Кубу водах имеются ценные промысловые рыбы, моллюски, лангусты, креветки, а также губки."+newline+""+newline+"Рельеф"+newline+""+newline+"Рельеф Кубы преимущественно равнинный. Возвышенности и горы занимают около трети территории. Самый высокий горный массив Сьерра–Маэстра протянулся вдоль юго-восточного побережья на 250 км. Его высшая точка — пик Туркино (1972 м). Расположенные на западе острова живописные невысокие горы причудливо рассечены и слабо заселены. На Кубе повсеместно развит карст, в связи с этим известно множество пещер, в том числе и крупных. Так, на западе пещера Санто-Томас имеет разветвленную сеть подземных галерей общей протяженностью 25 км. Часто встречаются так называемые «моготес» — формы тропического карста, представляющие собой возвышенности с почти вертикальными склонами и плоскими вершинами. Примерно 2/3 всей площади Кубы занимают слегка вс	холмленные равнины. Они наиболее заселены и освоены. Берега, как правило, низкие, иногда заболоченные, во многих случаях поросшие мангровыми зарослями. Часто встречаются песчаные пляжи, которые тянутся на многие километры (например, на полуострове Икакос, где расположен известный курорт Варадеро).";
	
		_root.text_container.text_fields.text_content_2.text = "Климат"+newline+""+newline+"Климат Кубы — тропический, пассатный. Среднегодовая температура составляет 25,5 °C. Средняя температура самого холодного месяца (январь) равна 22,5 °C и самого жаркого (август) — 27,8 °C. Температура поверхностных вод у берегов зимой составляет 22-24 °, летом — 28-30 °C. Среднегодовое количество осадков, выпадающих обычно в виде ливней — 1400 мм, однако нередко случаются и засушливые годы. На Кубе четко выражены два климатических сезона: дождливый (май-октябрь) и сухой (ноябрь-апрель). На сезон дождей приходится 3/4 всей годовой суммы осадков. Особенностью климата Кубы является типичная высокая влажность на протяжении всего года. Сочетание большой влажности и высокой температуры оказывает в целом неблагоприятное влияние на жизнь людей. Однако на побережье ветер с моря умеряет жару, приносит свежесть, а по вечерам и прохладу. В любом месте ветры отличаются известным постоянством, поэтому часто можно видеть деревья, стволы которых имеют и соответствующий наклон. Куба под	вержена действию тропических циклонов, которые зарождаются в летне-осенний период (июнь — середина ноября) к востоку от Малых Антильских островов и на западе Карибского моря, передвигаясь затем в сторону Флориды. Тайфуны сопровождаются обильными ливнями и сильнейшими ветрами, способными причинить большой ущерб хозяйству и населению острова. Реки на Кубе короткие, немноговодные. Леса, покрывающие около 10 % территории, сохранились лишь в горных и заболоченных районах. Животный мир суши относительно бедный. В то же время в окружающих Кубу водах имеются ценные промысловые рыбы, моллюски, лангусты, креветки, а также губки."+newline+""+newline+"Рельеф"+newline+""+newline+"Рельеф Кубы преимущественно равнинный. Возвышенности и горы занимают около трети территории. Самый высокий горный массив Сьерра–Маэстра протянулся вдоль юго-восточного побережья на 250 км. Его высшая точка — пик Туркино (1972 м). Расположенные на западе острова живописные невысокие горы причудливо рассечены и слабо заселены. На Кубе повсеместно развит карст, в связ	и с этим известно множество пещер, в том числе и крупных. Так, на западе пещера Санто-Томас имеет разветвленную сеть подземных галерей общей протяженностью 25 км. Часто встречаются так называемые «моготес» — формы тропического карста, представляющие собой возвышенности с почти вертикальными склонами и плоскими вершинами. Примерно 2/3 всей площади Кубы занимают слегка всхолмленные равнины. Они наиболее заселены и освоены. Берега, как правило, низкие, иногда заболоченные, во многих случаях поросшие мангровыми зарослями. Часто встречаются песчаные пляжи, которые тянутся на многие километры (например, на полуострове Икакос, где расположен известный курорт Варадеро)."+newline+""+newline+"Климат"+newline+""+newline+"Климат Кубы — тропический, пассатный. Среднегодовая температура составляет 25,5 °C. Средняя температура самого холодного месяца (январь) равна 22,5 °C и самого жаркого (август) — 27,8 °C. Температура поверхностных вод у берегов зимой составляет 22-24 °, летом — 28-30 °C. Среднегодовое количество осадков, выпадающих обычно в виде лив	ней — 1400 мм, однако нередко случаются и засушливые годы. На Кубе четко выражены два климатических сезона: дождливый (май-октябрь) и сухой (ноябрь-апрель). На сезон дождей приходится 3/4 всей годовой суммы осадков. Особенностью климата Кубы является типичная высокая влажность на протяжении всего года. Сочетание большой влажности и высокой температуры оказывает в целом неблагоприятное влияние на жизнь людей. Однако на побережье ветер с моря умеряет жару, приносит свежесть, а по вечерам и прохладу. В любом месте ветры отличаются известным постоянством, поэтому часто можно видеть деревья, стволы которых имеют и соответствующий наклон. Куба подвержена действию тропических циклонов, которые зарождаются в летне-осенний период (июнь — середина ноября) к востоку от Малых Антильских островов и на западе Карибского моря, передвигаясь затем в сторону Флориды. Тайфуны сопровождаются обильными ливнями и сильнейшими ветрами, способными причинить большой ущерб хозяйству и населению острова. Реки на Кубе короткие, немног	оводные. Леса, покрывающие около 10 % территории, сохранились лишь в горных и заболоченных районах. Животный мир суши относительно бедный. В то же время в окружающих Кубу водах имеются ценные промысловые рыбы, моллюски, лангусты, креветки, а также губки."+newline+""+newline+"Рельеф"+newline+""+newline+"Рельеф Кубы преимущественно равнинный. Возвышенности и горы занимают около трети территории. Самый высокий горный массив Сьерра–Маэстра протянулся вдоль юго-восточного побережья на 250 км. Его высшая точка — пик Туркино (1972 м). Расположенные на западе острова живописные невысокие горы причудливо рассечены и слабо заселены. На Кубе повсеместно развит карст, в связи с этим известно множество пещер, в том числе и крупных. Так, на западе пещера Санто-Томас имеет разветвленную сеть подземных галерей общей протяженностью 25 км. Часто встречаются так называемые «моготес» — формы тропического карста, представляющие собой возвышенности с почти вертикальными склонами и плоскими вершинами. Примерно 2/3 всей площади Кубы занимают слегка вс	холмленные равнины. Они наиболее заселены и освоены. Берега, как правило, низкие, иногда заболоченные, во многих случаях поросшие мангровыми зарослями. Часто встречаются песчаные пляжи, которые тянутся на многие километры (например, на полуострове Икакос, где расположен известный курорт Варадеро).";
	
	
	
		_root.text_container.text_fields.text_content_1.setTextFormat(my_fmt);
		_root.text_container.text_fields.text_content_2.setTextFormat(my_fmt);
		
		
		// рисуем верхний градиент в текстовом поле
		with(_root.text_container.text_gradient_top)
			{
				trace("top");
				graphics.beginGradientFill();
				colors = [0x647883, 0x647883];
	  			alphas = [100, 0];
				ratios = [0, 0xFF];
				graphics.lineStyle(1,0xffffff,0);
				matrix = {matrixType:"box", x:0, y:0, w:p1x, h:grad_height, r:(90/180)*Math.PI};
				graphics.beginGradientFill("linear", colors, alphas, ratios, matrix);
				graphics.moveTo(p1x,p1y);
	 			graphics.lineTo(p2x,p2y);
				graphics.lineTo(p2x,grad_height);
				graphics.lineTo(p1x,grad_height);
	  			graphics.lineTo(p1x,p1x);
				graphics.endFill();
			}
			
		// рисуем нижний градиент в текстовом поле
		with(_root.text_container.text_gradient_bottom)
			{
				trace("bottom");
				graphics.beginGradientFill();
				colors = [0x647883, 0x647883];
	  			alphas = [100, 0];
				ratios = [0, 0xFF];
				graphics.lineStyle(1,0xffffff,0);
				matrix = {matrixType:"box", x:0, y:p4y-grad_height, w:p1x, h:grad_height, r:(270/180)*Math.PI};
				graphics.beginGradientFill("linear", colors, alphas, ratios, matrix);
				graphics.moveTo(p4x,(p4y-grad_height));
	 			graphics.lineTo(p3x,(p3y-grad_height));
				graphics.lineTo(p3x,p3y);
				graphics.lineTo(p4x,p4y);
	  			graphics.lineTo(p4x,(p4y-grad_height));
				graphics.endFill();
			}
			
		// рисуем маску для текста
		with(_root.text_container.text_mask)
		{
			graphics.beginFill(0x000000,100);
			graphics.moveTo(p1x,p1y);
			graphics.lineTo(p2x,p2y);
			graphics.lineTo(p3x,p3y);
			graphics.lineTo(p4x,p4y);
			graphics.lineTo(p1x,p1y);
			graphics.endFill();
		}
		
		// рисуем зону, в при наведении в которую ползунок увеличивается
		with(_root.text_container.text_border.scroll_bar)
			{
			graphics.beginFill(0xffffff,0);
			
			graphics.moveTo(-s1,s1);
			graphics.lineTo(s1,s1);
			graphics.lineTo(s1,-s1);
			graphics.lineTo(-s1,-s1);
			graphics.lineTo(-s1,s1);
			
			graphics.endFill();
			}
			
		// рисуем верхний ограничитель скроллбара
		with(_root.text_container.text_border.bar_line_top)
			{
				
			graphics.lineStyle(0.5,0xffffff,100,false,"normal","none","miter",3);
			
			graphics.moveTo(-s2,0);
			graphics.lineTo(s2,0);
			
			}
		
		// рисуем нижний ограничитель скроллбара
		with(_root.text_container.text_border.bar_line_bottom)
			{
				
			graphics.lineStyle(0.5,0xffffff,100,false,"normal","none","miter",3);
			
			graphics.moveTo(-s2,0);
			graphics.lineTo(s2,0);
			
			}
		
		// рисуем ползунок
		with(_root.text_container.text_border.scroll_bar.bar_sq)
			{
			graphics.lineStyle(0.5,0xffffff,100,false,"normal","none","miter",3);
			graphics.beginFill(0xAED693,100);
			
			graphics.moveTo(-s2,s2);
			graphics.lineTo(s2,s2);
			graphics.lineTo(s2,-s2);
			graphics.lineTo(-s2,-s2);
			graphics.lineTo(-s2,s2);
			
			graphics.endFill();
			}
		
		// рисуем тень
		with(_root.text_container.text_border.scroll_bar.sq_shadow)
			{
			graphics.beginFill(0x000000,10);
			
			graphics.moveTo(-s2,s2);
			graphics.lineTo(s2,s2);
			graphics.lineTo(s2,-s2);
			graphics.lineTo(-s2,-s2);
			graphics.lineTo(-s2,s2);
			
			graphics.endFill();
			}
		
		// при наведении ползунок увеличивается
		_root.text_container.text_border.scroll_bar.onRollOver = public function () {					 
			TweenLite.to(_root.text_container.text_border.scroll_bar.bar_sq, 0.2, {scaleX:s1/s2*100, scaleY:s1/s2*100,ease:Quart.easeIn});
			TweenLite.to(_root.text_container.text_border.scroll_bar.sq_shadow, 0.2, {scaleX:s1/s2*100, scaleY:s1/s2*100,ease:Quart.easeIn});
			
			TweenLite.to(_root.text_container.text_border.bar_line_top, 0.2, {scaleX:s1/s2*100,ease:Quart.easeIn});
			TweenLite.to(_root.text_container.text_border.bar_line_bottom, 0.2, {scaleX:s1/s2*100,ease:Quart.easeIn});
							
		}
		
		// при отведении - уменьшается
		_root.text_container.text_border.scroll_bar.onRollOut = _root.text_container.text_border.scroll_bar.onReleaseOutside = function () {					 
			TweenLite.to(_root.text_container.text_border.scroll_bar.bar_sq, 1, {scaleX:100, scaleY:100,ease:Quart.easeOut});
			TweenLite.to(_root.text_container.text_border.scroll_bar.sq_shadow, 0.2, {scaleX:100, scaleY:100,ease:Quart.easeIn});
			
			TweenLite.to(_root.text_container.text_border.bar_line_top, 0.2, {scaleX:100,ease:Quart.easeIn});
			TweenLite.to(_root.text_container.text_border.bar_line_bottom, 0.2, {scaleX:100,ease:Quart.easeIn});
		}
		
		// зона перетаскивание ползунка
		_root.text_container.text_border.scroll_bar.onPress = function () {
			startDrag(this,false,(-d_txt),(s1+d_txt),(-d_txt),(p3y-s1-d_txt));
		}
		_root.text_container.text_border.scroll_bar.onRelease = _root.text_container.text_border.scroll_bar.onReleaseOutside = function () {
			stopDrag();
		}
		
		
		
		
	_root.text_container.text_canvas.onEnterFrame = function ()
		{
		
		// рамки для изображений
		with(_root.text_container.pics)
		{
			graphics.clear();
			
			graphics.lineStyle(0.5,0xffffff,100,false,"normal","none","miter",3);
			
			graphics.moveTo(_root.text_container.pic_point_0.x,_root.text_container.pic_point_0.y);
			graphics.lineTo(_root.text_container.pic_point_1.x,_root.text_container.pic_point_1.y);
			graphics.lineTo(_root.text_container.pic_point_2.x,_root.text_container.pic_point_2.y);
			graphics.lineTo(_root.text_container.pic_point_3.x,_root.text_container.pic_point_3.y);
			graphics.lineTo(_root.text_container.pic_point_0.x,_root.text_container.pic_point_0.y);
			
			graphics.moveTo(_root.text_container.pic_point_4.x,_root.text_container.pic_point_4.y);
			graphics.lineTo(_root.text_container.pic_point_5.x,_root.text_container.pic_point_5.y);
			graphics.lineTo(_root.text_container.pic_point_6.x,_root.text_container.pic_point_6.y);
			graphics.lineTo(_root.text_container.pic_point_7.x,_root.text_container.pic_point_7.y);
			graphics.lineTo(_root.text_container.pic_point_4.x,_root.text_container.pic_point_4.y);
			
			graphics.moveTo(_root.text_container.pic_point_8.x,_root.text_container.pic_point_8.y);
			graphics.lineTo(_root.text_container.pic_point_9.x,_root.text_container.pic_point_9.y);
			graphics.lineTo(_root.text_container.pic_point_10.x,_root.text_container.pic_point_10.y);
			graphics.lineTo(_root.text_container.pic_point_11.x,_root.text_container.pic_point_11.y);
			graphics.lineTo(_root.text_container.pic_point_8.x,_root.text_container.pic_point_8.y);
			
			}
		// рамка для фона текста
		with(_root.text_container.text_canvas)
			{
			graphics.clear();
			
			graphics.beginFill(0x647883,15);
			graphics.moveTo(_root.text_container.txt_point1.x,_root.text_container.txt_point1.y);
			graphics.lineTo(_root.text_container.txt_point2.x,_root.text_container.txt_point2.y);
			graphics.lineTo(_root.text_container.txt_point3.x,_root.text_container.txt_point3.y);
			graphics.lineTo(_root.text_container.txt_point4.x,_root.text_container.txt_point4.y);
			graphics.lineTo(_root.text_container.txt_point1.x,_root.text_container.txt_point1.y);
			graphics.endFill();
			}
			
		with(_root.text_container.text_border)
			{
			graphics.clear();
			
			graphics.lineStyle(0.5,0xffffff,100,false,"normal","none","miter",3);
			graphics.moveTo(p0x,p0y);
			graphics.lineTo(_root.text_container.txt_point0.x,_root.text_container.txt_point0.y);
			
			graphics.lineStyle(0.5,0xffffff,100,false,"normal","none","miter",3);
			graphics.moveTo(_root.text_container.txt_point1.x,_root.text_container.txt_point1.y);
			graphics.lineTo(_root.text_container.txt_point2.x,_root.text_container.txt_point2.y);
			graphics.lineTo(_root.text_container.txt_point3.x,_root.text_container.txt_point3.y);
			graphics.lineTo(_root.text_container.txt_point4.x,_root.text_container.txt_point4.y);
			graphics.lineTo(_root.text_container.txt_point1.x,_root.text_container.txt_point1.y);
			}
		}
	
	
		_root.text_container.text_canvas.alpha = 0;
		
		t1 = 0.6;
		t2 = 1.2;
		t3 = t1*0.22;
		trace(t3);
		
		timeline.appendMultiple([
			TweenLite.to(_root.text_container.txt_point0, t3, {x:p2x, y:p2y, ease:Quart.easeIn})
				],0,TweenAlign.START);	
		
		timeline.appendMultiple([
			TweenLite.to(_root.text_container.txt_point1, t1, {x:p1x, y:0, ease:Quart.easeOut}),
			TweenLite.to(_root.text_container.txt_point2, t1, {x:p2x, y:0, ease:Quart.easeOut}),
			TweenLite.to(_root.text_container.txt_point3, t1, {x:p3x, y:0, ease:Quart.easeOut}),
			TweenLite.to(_root.text_container.txt_point4, t1, {x:p4x, y:0, ease:Quart.easeOut})
					
				],0,TweenAlign.START);	
		
		
		timeline.appendMultiple([
			TweenLite.to(_root.text_container.txt_point1, t2, {x:p1x, y:p1y, ease:Quart.easeOut}),
			TweenLite.to(_root.text_container.txt_point2, t2, {x:p2x, y:p2y, ease:Quart.easeOut}),
			TweenLite.to(_root.text_container.txt_point3, t2, {x:p3x, y:p3y, ease:Quart.easeOut}),
			TweenLite.to(_root.text_container.txt_point4, t2, {x:p4x, y:p4y, ease:Quart.easeOut})
				
				],0.2,TweenAlign.START);	
		
		
		timeline.appendMultiple([
			TweenLite.to(_root.text_container.text_canvas, 1.2, {alpha:100, tint:0x000000,ease:Sine.easeIn}),
			TweenLite.to(_root.text_container.canvas_shadow, 1.2,{alpha:100,ease:Sine.easeIn}),
			
			TweenLite.to(_root.text_container.text_gradient_top, 1.2,{alpha:100,ease:Sine.easeIn}),
			TweenLite.to(_root.text_container.text_gradient_bottom, 1.2,{alpha:100,ease:Sine.easeIn}),
			
			TweenLite.to(_root.text_container.text_border.scroll_bar, 1.2,{alpha:100,ease:Sine.easeIn}),
			TweenLite.to(_root.text_container.text_border.bar_line_top, 1.2,{alpha:100,ease:Sine.easeIn}),
			TweenLite.to(_root.text_container.text_border.bar_line_bottom, 1.2,{alpha:100,ease:Sine.easeIn})
				
				],0,TweenAlign.START);	
		
		
		timeline.appendMultiple([
				TweenLite.to(_root.text_container.text_fields.text_content_1, 0.5,{alpha:100,ease:Sine.easeIn}),
				TweenLite.to(_root.text_container.text_fields.text_content_2, 0.5,{alpha:100,ease:Sine.easeIn})
				],-0.5,TweenAlign.START);	
		
		//появление картинок
		timeline.appendMultiple([
				TweenLite.to(_root.text_container.pic_point_2, 0.7, {y:pics_y[2]}),
				TweenLite.to(_root.text_container.pic_point_3, 0.7, {y:pics_y[3]})
				
				],0,TweenAlign.START);
		
		timeline.appendMultiple([			
				TweenLite.to(_root.text_container.pic_point_6, 0.5, {y:pics_y[6]}),
				TweenLite.to(_root.text_container.pic_point_7, 0.5, {y:pics_y[7]})
				
				],-0.3,TweenAlign.START);
		timeline.appendMultiple([
				TweenLite.to(_root.text_container.pic_point_10, 0.4, {y:pics_y[10]}),
				TweenLite.to(_root.text_container.pic_point_11, 0.4, {y:pics_y[11]})
				
				],-0.2,TweenAlign.START);	
		
		timeline.appendMultiple([
				TweenLite.to(_root.text_container.pic_point_1, 0.4, {x:pics_x[1]}),
				TweenLite.to(_root.text_container.pic_point_2, 0.4, {x:pics_x[2]})
				
				],-0.2,TweenAlign.START);
		
		
		timeline.appendMultiple([
				TweenLite.to(_root.text_container.pic_point_5, 0.4, {x:pics_x[5]}),
				TweenLite.to(_root.text_container.pic_point_6, 0.4, {x:pics_x[6]})
				
				],-0.2,TweenAlign.START);	
		
		timeline.appendMultiple([
				TweenLite.to(_root.text_container.pic_point_9, 0.4, {x:pics_x[9]}),
				TweenLite.to(_root.text_container.pic_point_10, 0.4, {x:pics_x[10]})
				
				],-0.2,TweenAlign.START);	
		
		function loading_pics ()
		{
			trace("loading");
		}
		
	}
	
	//переход от одного пункта с текстом к другому
	_root.txt_btn.onRelease = function () {
		
		if (_root.text_container.text_fields.x == -500)
		{
			TweenLite.to(_root.text_container.text_fields, 1, {x:0, y:0, ease:Quart.easeOut});
		}else
		if(_root.text_container.text_fields.x == 0)
		{
			TweenLite.to(_root.text_container.text_fields, 1, {x:-500, y:0, ease:Quart.easeOut});
		}
		
		trace("Release");
		
	}
	
	
	_root.links.filling.onRelease = function ()
	{
		_root.create_animation();
	}
				
	
	_root.text_container.onEnterFrame = function () {
	
				if((_root.text_container.text_fields.text_content_1.scrollV ==1)&&(_root.text_container.text_fields.x == -500))
				{
					_root.text_container.text_gradient_top.visible = 0;
					_root.text_container.text_gradient_bottom.visible = 1;
				}
				else
				if((_root.text_container.text_fields.text_content_1.scrollV == _root.text_container.text_fields.text_content_1.maxScrollV)&&(_root.text_container.text_fields.x == -500))
				{
					_root.text_container.text_gradient_top.visible = 1;
					_root.text_container.text_gradient_bottom.visible = 0;
				}			
				else
				{
					_root.text_container.text_gradient_top.visible = 1;
					_root.text_container.text_gradient_bottom.visible = 1;
				}
				}
	
	
	
	
	
}