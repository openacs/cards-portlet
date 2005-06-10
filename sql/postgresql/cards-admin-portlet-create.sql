--
-- Copyright (C) 2004 University of Valencia
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--
--
--   Procedures to support the cards portlet
--
--   @author fransola (fransola@uv.es)
--   @creation-date 2004-10-10
--   @version $Id: cards-admin-portlet-create.sql,v 0.1 2004/10/10

create function inline_0()
returns integer as '
declare
  ds_id portal_datasources.datasource_id%TYPE;
begin

  ds_id  = portal_datasource__new( ''cards_admin_portlet'', ''Cards Admin portlet'');


  --  the standard 4 params

  -- shadeable_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''shadeable_p'',
        ''f''
);      


  -- hideable_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''hideable_p'',
        ''f''
);      

  -- user_editable_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''user_editable_p'',
        ''f''
);      

  -- shaded_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''shaded_p'',
        ''f''
);      

  -- link_hideable_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''link_hideable_p'',
        ''t''
);  

-- cards_admin-specific params

  -- package_id must be configured
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''f'',
        ''package_id'',
        ''''
);

  return 0;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();


create function inline_1()
returns integer as '
begin

        -- create the implementation
        perform acs_sc_impl__new (
                ''portal_datasource'',
                ''cards_admin_portlet'',
                ''cards_admin_portlet''
        );

        -- add all the hooks
        perform acs_sc_impl_alias__new(
               ''portal_datasource'',
               ''cards_admin_portlet'',
               ''GetMyName'',
               ''cards_admin_portlet::get_my_name'',
               ''TCL''
        );

        perform acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''cards_admin_portlet'',
               ''GetPrettyName'',
               ''cards_admin_portlet::get_pretty_name'',
               ''TCL''
        );

        perform acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''cards_admin_portlet'',
               ''Link'',
               ''cards_admin_portlet::link'',
               ''TCL''
        );

        perform acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''cards_admin_portlet'',
               ''AddSelfToPage'',
               ''cards_admin_portlet::add_self_to_page'',
               ''TCL''
        );

        perform acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''cards_admin_portlet'',
               ''Show'',
               ''cards_admin_portlet::show'',
               ''TCL''
        );

        perform acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''cards_admin_portlet'',
               ''Edit'',
               ''cards_admin_portlet::edit'',
               ''TCL''
        );

        perform acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''cards_admin_portlet'',
               ''RemoveSelfFromPage'',
               ''cards_admin_portlet::remove_self_from_page'',
               ''TCL''
        );

        -- Add the binding
        perform acs_sc_binding__new (
            ''portal_datasource'',
            ''cards_admin_portlet''
        );

        return 0;
end;' language 'plpgsql';

select inline_1();
drop function inline_1();


