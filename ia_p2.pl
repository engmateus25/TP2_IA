% Definindo as probabilidades das variáveis
% a condição da rua (str) pode ser dry, wet ou snow_covered
0.8::str(dry).
0.1::str(wet).
0.1::str(snow_covered).

% A variavel flw representa o volante do dinamo desgastado
0.4::flw. % 0.6 é o complemento, a parte falsa que fica implicita

% Probabilidades condicionais de R (dínamo deslizante) dadas Str (condicão da rua) e Flw (volante desgastado)
0.5::r :- str(dry), flw.
0.0::r :- str(dry), \+flw.
0.7::r :- str(wet), flw.
0.3::r :- str(wet), \+flw.
0.5::r :- str(snow_covered), flw.
0.85::r :- str(snow_covered), \+flw.

% Probabilidades condicionais de V (voltagem) dada R (dínamo deslizante)
0.03::v :- r.
0.95::v :- \+r.

% definindo as probabilidades das outras variáveis
% B (lâmpada ok) e K (cabo ok)
0.99::b.
0.2::k.

% Probabilidades finais da luz ligada (Li) dadas V, B, e K influenciando diretamente Li.
0.99::li :- v, b, k.
0.01::li :- v, b, \+k.
0.01::li :- v, \+b, k.
0.001::li :- v, \+b, \+k.
0.3::li :- \+v, b, k.
0.005::li :- \+v, b, \+k.
0.005::li :- \+v, \+b, k.
0.0::li :- \+v, \+b, \+k.

% Evidência de que a condição da rua é snow_covered
evidence(str(snow_covered)).

% Consultas para calcular a probabilidade de V (voltagem)
query(v).

% teremos então como resposta, a probabilidade de V, dado que a rua está coberta de neve.