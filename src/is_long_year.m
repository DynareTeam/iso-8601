function i = is_long_year(y)

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

w = number_of_weeks_in(y);
i = (w(:)==53);

%@test:1
%$ 
%$ t = zeros(2,1);
%$
%$ try
%$     w = is_long_year(1:400);
%$     t(1) = 1;
%$ catch
%$     t(1) = 0;
%$ end
%$
%$ % The following 71 years in a 400-year cycle have 53
%$ % weeks (see http://en.wikipedia.org/wiki/ISO_week_date)
%$ j = [4, 9, 15, 20, 26, 32, 37, 43, 48, 54, 60, 65, 71, ...
%$      76, 82, 88, 93, 99, 105, 111, 116, 122, 128, 133, ...
%$      139, 144, 150, 156, 161, 167, 172, 178, 184, 189, ...
%$      195, 201, 207, 212, 218, 224, 229, 235, 240, 246, ...
%$      252, 257, 263, 268, 274, 280, 285, 291, 296, 303, ...
%$      308, 314, 320, 325, 331, 336, 342, 348, 353, 359, ...
%$      364, 370, 376, 381, 387, 392, 398 ];
%$
%$ if t(1)
%$     for i=1:length(j)
%$         t(i+1) = dassert(w(j(i)),true);
%$     end
%$ end
%$
%$ T = all(t);
%@eof:1