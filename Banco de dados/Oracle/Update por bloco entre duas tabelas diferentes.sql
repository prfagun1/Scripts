begin
	for x in (select COD_CLASSIF_FISCAL, cod_produto from LF_NF_ENTRADA_ITEM)
	loop
		update LF_NF_ENTRADA_ITEM set COD_CLASSIF_FISCAL = x.COD_CLASSIF_FISCAL
		where COD_PRODUTO = x.COD_PRODUTO;
	end loop;
end;