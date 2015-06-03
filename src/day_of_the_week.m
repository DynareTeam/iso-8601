function n  = day_of_the_week(y, m, d)

% Returns the day (1, 2, 3, 4, 5, 6 or 7) associated to a date y/m/d.
%
% INPUTS 
% - y [integer] scalar, the year.
% - m [integer] scalar, the month number.
% - d [integer] scalar, the day of the month.
%
% OUTPUS 
% - d [integer] scalar, the day of the week

% Copyright (C) 2015 Dynare Team
%
% The iso8601 package is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare iso8601 submodule is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

s = size(y);
    
if ~isequal(s, size(m)) || ~isequal(s, size(d))
    error('Input arguments must be arrays of the same size!')
end

t = [0; 3; 2; 5; 0; 3; 5; 1; 4; 6; 2; 4];

y = y(:) - (m(:) < 3);

n = mod(y + floor(y/4) - floor(y/100) + floor(y/400) + t(m(:)) + d(:), 7);

i = (n==0);
n(i) = 7;

n = reshape(n, s);

%@test:1
%$ 
%$ t = zeros(5,1);
%$
%$ try
%$     d = day_of_the_week(1972,10,7);
%$     t(1) = 1;
%$ catch
%$     t(1) = 0;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(d, 6);
%$     t(3) = dassert(day_of_the_week(1971,2,22), 1);
%$     t(4) = dassert(day_of_the_week(1973,1,25), 4);
%$     t(5) = dassert(day_of_the_week(2009,4,12), 7);
%$ end
%$
%$ T = all(t);
%@eof:1