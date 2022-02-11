import pluralize from './pluralize';

export default {
  User: Name => `${Name}_Users`,
  Channel: Name => `${Name}_Channels`,
  ChannelMember: Name => `${Name}_ChannelMembers`,
  refName: (community, ref) => `${community}_${pluralize(ref)}`,
};
