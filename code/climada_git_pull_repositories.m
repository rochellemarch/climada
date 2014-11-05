function climada_git_pull_repositories
% climada
% NAME:
%   climada_git_pull_repositories
% PURPOSE:
%   execute a git pull on all repositories
%
%   see also climada_code_copy
% CALLING SEQUENCE:
%   climada_git_pull_repositories
% EXAMPLE:
%   climada_git_pull_repositories
% INPUTS:
%   param1: 
%       > promted for if not given
% OPTIONAL INPUT PARAMETERS:
%   param2: as an example
% OUTPUTS:
% MODIFICATION HISTORY:
% David N. Bresch, david.bresch@gmail.com, 20141102
%-

global climada_global
if ~climada_init_vars,return;end % init/import global variables

%%if climada_global.verbose_mode,fprintf('*** %s ***\n',mfilename);end % show routine name on stdout

% poor man's version to check arguments
%if ~exist('param1','var'),param1=[];end

% PARAMETERS
%
% define the list of repositories to be updated
repository_list={
    'climada_module_country_risk'
    'climada_module_eq_global'
    'climada_module_etopo'
    'climada_module_GDP_entity'
    'climada_module_tc_hazard_advanced'
    'climada_module_tc_rain'
    'climada_module_tc_surge'
    'climada_module_ws_europe'
    };

parent_dir=deblank(climada_global.modules_dir);

for repository_i=1:length(repository_list)
    command_str=sprintf('cd %s%s%s ; git pull',parent_dir,filesep,repository_list{repository_i});
    fprintf('>>> %s\n',command_str)
    system(command_str);
end % repository_i

return