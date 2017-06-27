##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Chat < Domain
      class V2 < Version
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(friendly_name: nil)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ServiceInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Lists ServiceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams ServiceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields ServiceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to read the
          #                       limit with the most efficient page size, i.e. min(limit, 1000)
          def each
            limits = @version.read_limits

            page = self.page(
                page_size: limits[:page_size],
            )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Chat.V2.ServiceList>'
          end
        end

        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Chat.V2.ServicePage>'
          end
        end

        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @channels = nil
            @roles = nil
            @users = nil
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ServiceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] default_service_role_sid The default_service_role_sid
          # @param [String] default_channel_role_sid The default_channel_role_sid
          # @param [String] default_channel_creator_role_sid The
          #   default_channel_creator_role_sid
          # @param [Boolean] read_status_enabled The read_status_enabled
          # @param [Boolean] reachability_enabled The reachability_enabled
          # @param [String] typing_indicator_timeout The typing_indicator_timeout
          # @param [String] consumption_report_interval The consumption_report_interval
          # @param [Boolean] notifications_new_message_enabled The
          #   notifications.new_message.enabled
          # @param [String] notifications_new_message_template The
          #   notifications.new_message.template
          # @param [String] notifications_new_message_sound The
          #   notifications.new_message.sound
          # @param [Boolean] notifications_new_message_badge_count_enabled The
          #   notifications.new_message.badge_count_enabled
          # @param [Boolean] notifications_added_to_channel_enabled The
          #   notifications.added_to_channel.enabled
          # @param [String] notifications_added_to_channel_template The
          #   notifications.added_to_channel.template
          # @param [String] notifications_added_to_channel_sound The
          #   notifications.added_to_channel.sound
          # @param [Boolean] notifications_removed_from_channel_enabled The
          #   notifications.removed_from_channel.enabled
          # @param [String] notifications_removed_from_channel_template The
          #   notifications.removed_from_channel.template
          # @param [String] notifications_removed_from_channel_sound The
          #   notifications.removed_from_channel.sound
          # @param [Boolean] notifications_invited_to_channel_enabled The
          #   notifications.invited_to_channel.enabled
          # @param [String] notifications_invited_to_channel_template The
          #   notifications.invited_to_channel.template
          # @param [String] notifications_invited_to_channel_sound The
          #   notifications.invited_to_channel.sound
          # @param [String] pre_webhook_url The pre_webhook_url
          # @param [String] post_webhook_url The post_webhook_url
          # @param [String] webhook_method The webhook_method
          # @param [String] webhook_filters The webhook_filters
          # @param [String] limits_channel_members The limits.channel_members
          # @param [String] limits_user_channels The limits.user_channels
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, default_service_role_sid: :unset, default_channel_role_sid: :unset, default_channel_creator_role_sid: :unset, read_status_enabled: :unset, reachability_enabled: :unset, typing_indicator_timeout: :unset, consumption_report_interval: :unset, notifications_new_message_enabled: :unset, notifications_new_message_template: :unset, notifications_new_message_sound: :unset, notifications_new_message_badge_count_enabled: :unset, notifications_added_to_channel_enabled: :unset, notifications_added_to_channel_template: :unset, notifications_added_to_channel_sound: :unset, notifications_removed_from_channel_enabled: :unset, notifications_removed_from_channel_template: :unset, notifications_removed_from_channel_sound: :unset, notifications_invited_to_channel_enabled: :unset, notifications_invited_to_channel_template: :unset, notifications_invited_to_channel_sound: :unset, pre_webhook_url: :unset, post_webhook_url: :unset, webhook_method: :unset, webhook_filters: :unset, limits_channel_members: :unset, limits_user_channels: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'DefaultServiceRoleSid' => default_service_role_sid,
                'DefaultChannelRoleSid' => default_channel_role_sid,
                'DefaultChannelCreatorRoleSid' => default_channel_creator_role_sid,
                'ReadStatusEnabled' => read_status_enabled,
                'ReachabilityEnabled' => reachability_enabled,
                'TypingIndicatorTimeout' => typing_indicator_timeout,
                'ConsumptionReportInterval' => consumption_report_interval,
                'Notifications.NewMessage.Enabled' => notifications_new_message_enabled,
                'Notifications.NewMessage.Template' => notifications_new_message_template,
                'Notifications.NewMessage.Sound' => notifications_new_message_sound,
                'Notifications.NewMessage.BadgeCountEnabled' => notifications_new_message_badge_count_enabled,
                'Notifications.AddedToChannel.Enabled' => notifications_added_to_channel_enabled,
                'Notifications.AddedToChannel.Template' => notifications_added_to_channel_template,
                'Notifications.AddedToChannel.Sound' => notifications_added_to_channel_sound,
                'Notifications.RemovedFromChannel.Enabled' => notifications_removed_from_channel_enabled,
                'Notifications.RemovedFromChannel.Template' => notifications_removed_from_channel_template,
                'Notifications.RemovedFromChannel.Sound' => notifications_removed_from_channel_sound,
                'Notifications.InvitedToChannel.Enabled' => notifications_invited_to_channel_enabled,
                'Notifications.InvitedToChannel.Template' => notifications_invited_to_channel_template,
                'Notifications.InvitedToChannel.Sound' => notifications_invited_to_channel_sound,
                'PreWebhookUrl' => pre_webhook_url,
                'PostWebhookUrl' => post_webhook_url,
                'WebhookMethod' => webhook_method,
                'WebhookFilters' => webhook_filters,
                'Limits.ChannelMembers' => limits_channel_members,
                'Limits.UserChannels' => limits_user_channels,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ServiceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Access the channels
          # @return [ChannelList] if a(n) ChannelList object was created.
          # @return [ChannelContext] if a(n) ChannelContext object was created.
          def channels(sid=:unset)
            if sid != :unset
              return ChannelContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @channels
              @channels = ChannelList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @channels
          end

          ##
          # Access the roles
          # @return [RoleList] if a(n) RoleList object was created.
          # @return [RoleContext] if a(n) RoleContext object was created.
          def roles(sid=:unset)
            if sid != :unset
              return RoleContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @roles
              @roles = RoleList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @roles
          end

          ##
          # Access the users
          # @return [UserList] if a(n) UserList object was created.
          # @return [UserContext] if a(n) UserContext object was created.
          def users(sid=:unset)
            if sid != :unset
              return UserContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @users
              @users = UserList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @users
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Chat.V2.ServiceContext #{context}>"
          end
        end

        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'default_service_role_sid' => payload['default_service_role_sid'],
                'default_channel_role_sid' => payload['default_channel_role_sid'],
                'default_channel_creator_role_sid' => payload['default_channel_creator_role_sid'],
                'read_status_enabled' => payload['read_status_enabled'],
                'reachability_enabled' => payload['reachability_enabled'],
                'typing_indicator_timeout' => payload['typing_indicator_timeout'].to_i,
                'consumption_report_interval' => payload['consumption_report_interval'].to_i,
                'limits' => payload['limits'],
                'pre_webhook_url' => payload['pre_webhook_url'],
                'post_webhook_url' => payload['post_webhook_url'],
                'webhook_method' => payload['webhook_method'],
                'webhook_filters' => payload['webhook_filters'],
                'notifications' => payload['notifications'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end

          def sid
            @properties['sid']
          end

          def account_sid
            @properties['account_sid']
          end

          def friendly_name
            @properties['friendly_name']
          end

          def date_created
            @properties['date_created']
          end

          def date_updated
            @properties['date_updated']
          end

          def default_service_role_sid
            @properties['default_service_role_sid']
          end

          def default_channel_role_sid
            @properties['default_channel_role_sid']
          end

          def default_channel_creator_role_sid
            @properties['default_channel_creator_role_sid']
          end

          def read_status_enabled
            @properties['read_status_enabled']
          end

          def reachability_enabled
            @properties['reachability_enabled']
          end

          def typing_indicator_timeout
            @properties['typing_indicator_timeout']
          end

          def consumption_report_interval
            @properties['consumption_report_interval']
          end

          def limits
            @properties['limits']
          end

          def pre_webhook_url
            @properties['pre_webhook_url']
          end

          def post_webhook_url
            @properties['post_webhook_url']
          end

          def webhook_method
            @properties['webhook_method']
          end

          def webhook_filters
            @properties['webhook_filters']
          end

          def notifications
            @properties['notifications']
          end

          def url
            @properties['url']
          end

          def links
            @properties['links']
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] default_service_role_sid The default_service_role_sid
          # @param [String] default_channel_role_sid The default_channel_role_sid
          # @param [String] default_channel_creator_role_sid The
          #   default_channel_creator_role_sid
          # @param [Boolean] read_status_enabled The read_status_enabled
          # @param [Boolean] reachability_enabled The reachability_enabled
          # @param [String] typing_indicator_timeout The typing_indicator_timeout
          # @param [String] consumption_report_interval The consumption_report_interval
          # @param [Boolean] notifications_new_message_enabled The
          #   notifications.new_message.enabled
          # @param [String] notifications_new_message_template The
          #   notifications.new_message.template
          # @param [String] notifications_new_message_sound The
          #   notifications.new_message.sound
          # @param [Boolean] notifications_new_message_badge_count_enabled The
          #   notifications.new_message.badge_count_enabled
          # @param [Boolean] notifications_added_to_channel_enabled The
          #   notifications.added_to_channel.enabled
          # @param [String] notifications_added_to_channel_template The
          #   notifications.added_to_channel.template
          # @param [String] notifications_added_to_channel_sound The
          #   notifications.added_to_channel.sound
          # @param [Boolean] notifications_removed_from_channel_enabled The
          #   notifications.removed_from_channel.enabled
          # @param [String] notifications_removed_from_channel_template The
          #   notifications.removed_from_channel.template
          # @param [String] notifications_removed_from_channel_sound The
          #   notifications.removed_from_channel.sound
          # @param [Boolean] notifications_invited_to_channel_enabled The
          #   notifications.invited_to_channel.enabled
          # @param [String] notifications_invited_to_channel_template The
          #   notifications.invited_to_channel.template
          # @param [String] notifications_invited_to_channel_sound The
          #   notifications.invited_to_channel.sound
          # @param [String] pre_webhook_url The pre_webhook_url
          # @param [String] post_webhook_url The post_webhook_url
          # @param [String] webhook_method The webhook_method
          # @param [String] webhook_filters The webhook_filters
          # @param [String] limits_channel_members The limits.channel_members
          # @param [String] limits_user_channels The limits.user_channels
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: :unset, default_service_role_sid: :unset, default_channel_role_sid: :unset, default_channel_creator_role_sid: :unset, read_status_enabled: :unset, reachability_enabled: :unset, typing_indicator_timeout: :unset, consumption_report_interval: :unset, notifications_new_message_enabled: :unset, notifications_new_message_template: :unset, notifications_new_message_sound: :unset, notifications_new_message_badge_count_enabled: :unset, notifications_added_to_channel_enabled: :unset, notifications_added_to_channel_template: :unset, notifications_added_to_channel_sound: :unset, notifications_removed_from_channel_enabled: :unset, notifications_removed_from_channel_template: :unset, notifications_removed_from_channel_sound: :unset, notifications_invited_to_channel_enabled: :unset, notifications_invited_to_channel_template: :unset, notifications_invited_to_channel_sound: :unset, pre_webhook_url: :unset, post_webhook_url: :unset, webhook_method: :unset, webhook_filters: :unset, limits_channel_members: :unset, limits_user_channels: :unset)
            context.update(
                friendly_name: friendly_name,
                default_service_role_sid: default_service_role_sid,
                default_channel_role_sid: default_channel_role_sid,
                default_channel_creator_role_sid: default_channel_creator_role_sid,
                read_status_enabled: read_status_enabled,
                reachability_enabled: reachability_enabled,
                typing_indicator_timeout: typing_indicator_timeout,
                consumption_report_interval: consumption_report_interval,
                notifications_new_message_enabled: notifications_new_message_enabled,
                notifications_new_message_template: notifications_new_message_template,
                notifications_new_message_sound: notifications_new_message_sound,
                notifications_new_message_badge_count_enabled: notifications_new_message_badge_count_enabled,
                notifications_added_to_channel_enabled: notifications_added_to_channel_enabled,
                notifications_added_to_channel_template: notifications_added_to_channel_template,
                notifications_added_to_channel_sound: notifications_added_to_channel_sound,
                notifications_removed_from_channel_enabled: notifications_removed_from_channel_enabled,
                notifications_removed_from_channel_template: notifications_removed_from_channel_template,
                notifications_removed_from_channel_sound: notifications_removed_from_channel_sound,
                notifications_invited_to_channel_enabled: notifications_invited_to_channel_enabled,
                notifications_invited_to_channel_template: notifications_invited_to_channel_template,
                notifications_invited_to_channel_sound: notifications_invited_to_channel_sound,
                pre_webhook_url: pre_webhook_url,
                post_webhook_url: post_webhook_url,
                webhook_method: webhook_method,
                webhook_filters: webhook_filters,
                limits_channel_members: limits_channel_members,
                limits_user_channels: limits_user_channels,
            )
          end

          ##
          # Access the channels
          # @return [channels] channels
          def channels
            context.channels
          end

          ##
          # Access the roles
          # @return [roles] roles
          def roles
            context.roles
          end

          ##
          # Access the users
          # @return [users] users
          def users
            context.users
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Chat.V2.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end