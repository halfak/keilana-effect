figures = \
		figures/biology_monthly_assessments.pdf \
		figures/biology_monthly_wp10.pdf \
		figures/mean_weighted_sum_ws_vs_all.pdf \
		figures/proportion_empty2c_ws_vs_all.pdf \
		figures/proportion_b2fa_ws_vs_all.pdf \
		figures/murie_curie_prediction.tex \
		figures/empirical_and_predicted_biology.tex\
		figures/ws_vs_all.tex

parts = \
		parts/abstract.tex \
		parts/authors.tex \
		parts/body.tex \
		parts/copyright.tex \
		parts/meta.tex \
		parts/util.tex

sections = \
		sections/acknowledgements.tex \
		sections/conclusion.tex \
		sections/demonstration.tex \
		sections/discussion.tex \
		sections/future_work.tex \
		sections/introduction.tex \
		sections/limitations.tex \
		sections/methods_for_measuring.tex \
		sections/modeling_actionable_quality.tex \
		sections/quality_dynamics.tex \
		sections/quality_of_wikipedia.tex

tables = \
		tables/assessment_scale.tex \
		tables/b_class_criteria.tex \
		tables/fitness_statistics.tex


halfaker2016keilana.pdf: halfaker2016keilana.tex \
		$(figures) $(parts) $(sections) $(tables) refs.bib
	rubber --pdf halfaker2016keilana.tex

halfaker2016keilana.with_font.pdf: halfaker2016keilana.pdf
	ps2pdf13 -dPDFSETTINGS=/prepress halfaker2016keilana.pdf halfaker2016keilana.with_fonts.pdf


halfaker2016keilana.tar.gz: halfaker2016keilana.arxiv.pdf sigchi.cls
	tar -zcf halfaker2016keilana.tar.gz \
	         halfaker2016keilana.tex sigchi.cls figures parts sections tables

figures/biology_monthly_assessments.svg:
	wget https://upload.wikimedia.org/wikipedia/commons/1/1f/Enwiki.biology.monthly_assessments.svg -qO- > \
	figures/biology_monthly_assessments.svg

figures/biology_monthly_assessments.pdf: figures/biology_monthly_assessments.svg
	rsvg-convert -f pdf -o figures/biology_monthly_assessments.pdf figures/biology_monthly_assessments.svg

figures/biology_monthly_wp10.svg:
	wget https://upload.wikimedia.org/wikipedia/commons/6/64/Enwiki.biology.monthly_wp10.svg -qO- > \
	figures/biology_monthly_wp10.svg

figures/biology_monthly_wp10.pdf: figures/biology_monthly_wp10.svg
	rsvg-convert -f pdf -o figures/biology_monthly_wp10.pdf figures/biology_monthly_wp10.svg

figures/mean_weighted_sum_ws_vs_all.svg:
	wget https://upload.wikimedia.org/wikipedia/commons/a/ac/Enwiki_mean_weighted_sum.diff_of_all_ws.annotated.svg -qO- > \
	figures/mean_weighted_sum_ws_vs_all.svg

figures/mean_weighted_sum_ws_vs_all.pdf: figures/mean_weighted_sum_ws_vs_all.svg
	rsvg-convert -f pdf -o figures/mean_weighted_sum_ws_vs_all.pdf figures/mean_weighted_sum_ws_vs_all.svg

figures/proportion_empty2c_ws_vs_all.svg:
	wget https://upload.wikimedia.org/wikipedia/commons/0/0a/Enwiki_proportion_of_class.empty2c.all_and_ws.svg -qO- > \
	figures/proportion_empty2c_ws_vs_all.svg

figures/proportion_empty2c_ws_vs_all.pdf: figures/proportion_empty2c_ws_vs_all.svg
	rsvg-convert -f pdf -o figures/proportion_empty2c_ws_vs_all.pdf figures/proportion_empty2c_ws_vs_all.svg

figures/proportion_b2fa_ws_vs_all.svg:
	wget https://upload.wikimedia.org/wikipedia/commons/0/00/Enwiki_proportion_of_class.b2fa.all_and_ws.svg -qO- > \
	figures/proportion_b2fa_ws_vs_all.svg

figures/proportion_b2fa_ws_vs_all.pdf: figures/proportion_b2fa_ws_vs_all.svg
	rsvg-convert -f pdf -o figures/proportion_b2fa_ws_vs_all.pdf figures/proportion_b2fa_ws_vs_all.svg
