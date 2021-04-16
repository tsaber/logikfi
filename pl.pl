loves(vincent,mia).
loves(marcellus,mia).
loves(pumpkin,honeybunny).
loves(honeybunny,pumpkin).
jealous(X,Y):- 
	loves(X,Z),
	loves(Y,Z).
